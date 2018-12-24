#! /bin/bash

rm -rf /AppDir && mkdir /AppDir
cd /AppDir
#bsdtar xfp /AppImage
/AppImage --appimage-extract
/AppDir/squashfs-root/AppRun
