#! /bin/bash

rm -rf /AppDir && mkdir /AppDir
cd /AppDir
bsdtar xfp /AppImage
./AppRun