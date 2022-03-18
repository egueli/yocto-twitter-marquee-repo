# yocto-twitter-marquee-repo

Showing personal Twitter timeline to an old [Sigma ASC 333](https://revspace.nl/Lichtkrant_Sigma_ASC_333) LED marquee display using a [TechNexion PICO-Pi-IMX7](https://developer.technexion.com/docs/pico-imx7) running Yocto Linux.

This repository only contains the metadata needed to download the custom Yocto Linux sources. Do not clone this repository; instead, use it as the base URL for a [repo](https://gerrit.googlesource.com/git-repo/+/refs/heads/master/README.md) workspace:

    mkdir yocto-twitter-marquee
    cd yocto-twitter-marquee
    repo init -u https://github.com/egueli/yocto-twitter-marquee-repo.git
    repo sync -j8
    
For more information & options, read the README at [TechNexion BSP](https://github.com/TechNexion/tn-imx-yocto-manifest/tree/hardknott_5.10.y-stable) repository.
