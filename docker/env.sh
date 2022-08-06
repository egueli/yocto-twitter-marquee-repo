# Set up the build environment (when the image is run)
WIFI_FIRMWARE=y
WIFI_MODULE=qca
DISTRO=fsl-imx-wayland
MACHINE=pico-imx7
BASEBOARD=pi
source ./tn-setup-release.sh -b build-wayland-pico-imx7
