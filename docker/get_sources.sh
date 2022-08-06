#!/bin/bash
# set -e

# Download from all the repos
repo init -u https://github.com/egueli/yocto-twitter-marquee-repo.git
repo sync -j8
