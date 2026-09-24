#!/bin/sh
set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export DEPLOY_GSTREAMER=1
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export DESKTOP=/usr/share/applications/pix.desktop
export ICON=/usr/share/icons/hicolor/scalable/apps/pix.svg

# Deploy dependencies
quick-sharun \
	/usr/bin/pix \
	/usr/lib/pix \
	/usr/share/pix

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the AppImage
quick-sharun --simple-test ./dist/*.AppImage
