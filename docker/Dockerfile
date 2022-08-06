# Inspired by https://embeddeduse.com/2019/02/11/using-docker-containers-for-yocto-builds/
#
# The image built with this Dockerfile assumes a volume binding to /home/led-marquee/yocto/output, e.g.
# docker run -it -v /some/host/dir:/home/led-marquee/yocto/output yocto-twitter-marquee:latest 

FROM ubuntu:20.04

# Prevent the package install below to stop to ask user about the timezone.
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install all the packages needed to build Yocto and develop on the kernel.
RUN apt-get update && apt-get -y install gawk wget git git-core diffstat unzip texinfo gcc-multilib build-essential \
chrpath socat cpio python python3 python3-pip python3-pexpect python3-git python3-jinja2 libegl1-mesa pylint3 rsync \
bc bison xz-utils debianutils iputils-ping libsdl1.2-dev xterm language-pack-en coreutils texi2html file docbook-utils \
python-pysqlite2 help2man desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev mercurial autoconf automake groff curl \
lzop asciidoc u-boot-tools libreoffice-writer sshpass ssh-askpass zip xz-utils kpartx vim screen libssl-dev flex \
libncurses-dev libssl-dev

# Install packages needed for Ecli[pse development
RUN apt-get update && apt-get -y install libswt-gtk-4-java libswt-gtk-4-jni

# Use bash instead of default dash
RUN rm /bin/sh && ln -s bash /bin/sh

# Set the locale to UTF-8 so the builds work fine
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Copy the scripts that will be used later
RUN mkdir -p /scripts
ADD get_sources.sh /scripts
ADD env.sh /scripts

# Set up internal Docker user (default is root, we don´t wanna use root)
ENV USER_NAME led-marquee

ARG host_uid=1001
ARG host_gid=1001
RUN groupadd -g $host_gid $USER_NAME && \
    useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME

USER $USER_NAME
ENV USER_HOME /home/$USER_NAME

# Set up the repo tool
RUN mkdir $USER_HOME/bin
ENV PATH $USER_HOME/bin:$PATH
RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > $USER_HOME/bin/repo
RUN chmod a+x $USER_HOME/bin/repo

# Set up the base directory where everything will be downloaded and built
ENV YOCTO_ROOT_DIR $USER_HOME/yocto
RUN mkdir -p $YOCTO_ROOT_DIR
WORKDIR $YOCTO_ROOT_DIR

# We need this to download with Repo
RUN git config --global user.name "Yocto Git Client"
RUN git config --global user.email "dummy@email.com"
RUN git config --global color.ui true

# Download all the sources
RUN /scripts/get_sources.sh

# Install Eclipse
# TODO figure out why this doesn't actually create an eclipse directory anywhere
#RUN curl https://ftp.halifax.rwth-aachen.de/eclipse/technology/epp/downloads/release/2022-06/R/eclipse-cpp-2022-06-R-linux-gtk-x86_64.tar.gz | tar zxv -C $YOCTO_ROOT_DIR

# Set the environment variables required to launch bitbake & co.
RUN cat /scripts/env.sh >> $USER_HOME/.bashrc

# Starting the Docker container will make you ready to develop the Twitter LED Marquee. Enjoy!
CMD /bin/bash