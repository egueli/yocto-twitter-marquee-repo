# yocto-twitter-marquee-repo

Showing personal Twitter timeline to an old [Sigma ASC 333](https://revspace.nl/Lichtkrant_Sigma_ASC_333) LED marquee display using a [TechNexion PICO-Pi-IMX7](https://developer.technexion.com/docs/pico-imx7) running Yocto Linux.

This repository contains:
* the [repo](https://gerrit.googlesource.com/git-repo/+/refs/heads/master/README.md) metadata needed to download the custom Yocto Linux sources. 
* the Dockerfile to create the image that can build Yocto images;

## Creating the Docker container

    cd docker
    docker build --tag yocto-twitter-marquee:latest .

## Running the container

    docker run -it yocto-twitter-marquee:latest

The first time it will ask to accept the Freescale EULA. Then you'll be dropped to a Bash shell with the Yocto build already configured. From there you can e.g.:

    time bitbake imx-image-full

    
For more details, read the README at [TechNexion BSP](https://github.com/TechNexion/tn-imx-yocto-manifest/tree/hardknott_5.10.y-stable) repository.
