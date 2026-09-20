#!/bin/sh
set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q maui-pix 2>/dev/null | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export DESKTOP=/usr/share/applications/org.kde.pix.desktop
export ICON=/usr/share/icons/hicolor/scalable/apps/pix.svg

# Deploy dependencies
quick-sharun /usr/bin/pix

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the AppImage
quick-sharun --simple-test ./dist/*.AppImage
