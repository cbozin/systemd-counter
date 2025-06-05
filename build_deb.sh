#!/bin/sh

TEMP_DIR=temp
echo "Starting deb package build"
echo "Making directory tree"
mkdir -p $TEMP_DIR
mkdir -p $TEMP_DIR/etc/
mkdir -p $TEMP_DIR/usr/bin/
mkdir -p $TEMP_DIR/DEBIAN

echo "copying control file for DEBIAN"
cp DEBIAN/control $TEMP_DIR/DEBIAN/

echo "copying conffiles for DEBIAN"
cp DEBIAN/conffiles $TEMP_DIR/DEBIAN/

echo "copying binary"
cp bin/systemd_counter.py $TEMP_DIR/usr/bin/

echo "copying configuration file"
cp counter.conf $TEMP_DIR/etc/

echo "copying post install script"
cp DEBIAN/postinst $TEMP_DIR/DEBIAN/

echo "copying post remove script"
cp DEBIAN/postrm $TEMP_DIR/DEBIAN/

echo "copying pre remove script"
cp DEBIAN/prerm $TEMP_DIR/DEBIAN/

echo "building deb file"
dpkg-deb --root-owner-group --build $TEMP_DIR
mv $TEMP_DIR.deb counter-v2.0.0.deb

echo "done"