#! /bin/bash

rm -rf /AppDir && mkdir /AppDir
cd /AppDir

/AppImage --appimage-extract
/AppDir/squashfs-root/AppRun
