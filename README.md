<div align="center">

# Pix-AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/ArqamQazi/Pix-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/ArqamQazi/Pix-AppImage/releases/latest)
[![CI Build Status](https://github.com/ArqamQazi/Pix-AppImage/actions/workflows/appimage.yml/badge.svg)](https://github.com/ArqamQazi/Pix-AppImage/releases/latest)
[![Latest Stable Release](https://img.shields.io/github/v/release/ArqamQazi/Pix-AppImage)](https://github.com/ArqamQazi/Pix-AppImage/releases/latest)

<p align="center">
  <img src="https://raw.githubusercontent.com/linuxmint/pix/master/data/icons/public/hicolor/scalable/apps/pix.svg" width="128" alt="Pix Logo" />
</p>


| Latest Stable Release | Upstream URL |
| :---: | :---: |
| [Click here](https://github.com/ArqamQazi/Pix-AppImage/releases/latest) | [Click here](https://github.com/linuxmint/pix) |

</div>

---

### Description

Pix is an image viewer and browser based on gThumb for the X-Apps project (Linux Mint). It allows viewing and organizing images with support for various operations, formats, and extensions.

Features:
- **Image Browser**: Browse image directories with thumbnails, bookmark folders, and organize into catalogs.
- **Image Viewer & Slideshows**: View single images, full-screen slideshows, and zoom/pan.
- **Image Editing**: Basic editing tools including resize, crop, rotate, flip, and color adjustments.
- **Metadata Support**: View and edit image EXIF, IPTC, and XMP metadata via Exiv2.
- **Format Support**: Supports JPEG, PNG, TIFF, WebP, AVIF, HEIF, JPEG-XL, RAW images, and more.
- **Video & Audio Playback**: Multimedia playback support via GStreamer.
- **Batch Tools & Web Albums**: Batch image conversion, resizing, renaming, and HTML web album generation.

### Omitted Upstream Dependencies

To keep the AppImage portable, lightweight, and avoid unnecessary bloat, the following legacy upstream optional dependencies are intentionally omitted:

- **`clutter`, `clutter-gtk`** (*Legacy 3D slideshow effects*): Standard full-screen slideshows are fully supported and work natively out-of-the-box using GTK. Clutter was only used for obsolete OpenGL 3D transition animations (like cube-flip effects), which is deprecated by GNOME and disabled by default upstream.
- **`champlain`, `champlain-gtk`** (*Map location view*): Displays the location of geotagged photos on an embedded map. Disabled upstream as it depends on deprecated Clutter.
- **`webkit2gtk`, `libsoup`, `json-glib`** (*Web uploaders for Flickr/23hq*): Legacy in-app upload dialogs. Omitted to avoid bundling a massive ~150–200 MB web browser engine and runtime sandboxing issues for outdated web APIs.
- **`brasero`** (*CD/DVD burning*): Legacy optical disc burning library for writing photos to physical discs.

---

AppImage made using [quick-sharun](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh), which makes it extremely easy to turn any binary into a portable package reliably without using containers or similar tricks. 

**This AppImage bundles everything and it should work on any Linux distro, including old and musl-based ones.**

This AppImage doesn't require FUSE to run at all, thanks to the [uruntime](https://github.com/VHSgunzo/uruntime).

This AppImage is also supplied with a self-updater by default, so any updates to this application won't be missed, you will be prompted for permission to check for updates and if agreed you will then be notified when a new update is available.

Self-updater is disabled by default if AppImage managers like [am](https://github.com/ivan-hc/AM), [soar](https://github.com/pkgforge/soar) or [dbin](https://github.com/xplshn/dbin) exist, which manage AppImage updates.

<details>
  <summary><b><i>raison d'être</i></b></summary>
    <img src="https://github.com/user-attachments/assets/d40067a6-37d2-4784-927c-2c7f7cc6104b" alt="Inspiration Image">
</details>

---

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)

