#! /bin/bash

rm -rf /AppDir && mkdir /AppDir
cd /AppDir

/AppImage --appimage-extract

# https://docs.appimage.org/packaging-guide/environment-variables.html#type-2-appimage-runtime
export APPIMAGE=/AppImage
export APPDIR=/AppDir/squashfs-root
export OWD=$(pwd)

exec "$APPDIR"/AppRun $@
