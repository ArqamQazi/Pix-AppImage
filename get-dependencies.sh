#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	meson \
	ninja \
	itstool \
	intltool \
	glib2-devel \
	git \
	desktop-file-utils \
	gsettings-desktop-schemas \
	gtk3 \
	xapp \
	exiv2 \
	exempi \
	lcms2 \
	libraw \
	libjpeg-turbo \
	libtiff \
	librsvg \
	libwebp \
	libheif \
	libjxl \
	libsecret \
	gstreamer \
	gst-plugins-base-libs \
	gst-plugins-good \
	gst-libav

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Building pix from upstream source..."
echo "---------------------------------------------------------------"
if [ "${DEVEL_RELEASE-}" = 1 ]; then
	git clone --depth 1 https://github.com/linuxmint/pix.git /tmp/pix
	cd /tmp/pix
	VERSION=$(git describe --tags --always)
else
	TAG=$(git ls-remote --tags --refs https://github.com/linuxmint/pix.git | sed -E 's/^[0-9a-f]+[[:space:]]+refs\/tags\///' | grep -E '^[0-9]+\.[0-9]+' | sort -V | tail -n 1)
	git clone --depth 1 --branch "$TAG" https://github.com/linuxmint/pix.git /tmp/pix
	cd /tmp/pix
	VERSION="$TAG"
fi

echo "$VERSION" > ~/version

meson setup build \
	--prefix=/usr \
	--libexecdir=lib/pix \
	--buildtype=plain \
	-Dclutter=false

ninja -C build
ninja -C build install

