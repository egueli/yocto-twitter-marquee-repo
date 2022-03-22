# yocto-twitter-marquee-repo

Showing personal Twitter timeline to an old [Sigma ASC 333](https://revspace.nl/Lichtkrant_Sigma_ASC_333) LED marquee display using a [TechNexion PICO-Pi-IMX7](https://developer.technexion.com/docs/pico-imx7) running Yocto Linux.

This repository only contains the metadata needed to download the custom Yocto Linux sources. Do not clone this repository; instead, use it as the base URL for a [repo](https://gerrit.googlesource.com/git-repo/+/refs/heads/master/README.md) workspace.

1. install/update all the packages needed for build:

        sudo apt update
        sudo apt-get install gawk wget git git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect python3-git python3-jinja2 libegl1-mesa pylint3 rsync bc bison xz-utils debianutils iputils-ping libsdl1.2-dev xterm language-pack-en coreutils texi2html file docbook-utils python-pysqlite2 help2man desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev mercurial autoconf automake groff curl lzop asciidoc u-boot-tools libreoffice-writer sshpass ssh-askpass zip xz-utils kpartx vim screen python-is-python3 libssl-dev

2. install repo

        mkdir ~/bin
        curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
        chmod a+x ~/bin/repo
        PATH=${PATH}:~/bin

3. create the development directory:

        mkdir yocto-twitter-marquee
        cd yocto-twitter-marquee

4. download all the sources with repo:

        repo init -u https://github.com/egueli/yocto-twitter-marquee-repo.git
        repo sync -j8
    
5. build the image (this will take hours and use ~70GB of hard drive space):

        WIFI_FIRMWARE=y WIFI_MODULE=qca DISTRO=fsl-imx-wayland MACHINE=pico-imx7 BASEBOARD=pi source tn-setup-release.sh -b build-wayland-pico-imx7
        time bitbake imx-image-full

    
For more details, read the README at [TechNexion BSP](https://github.com/TechNexion/tn-imx-yocto-manifest/tree/hardknott_5.10.y-stable) repository.
