#!/bin/sh

INSTALL_DIR=/usr/local/bin/
MAIN_PROGRAM_FILE=systemd_counter.py
CONFIGURATION_INSTALL_DIR=/etc/
MAIN_CONFIG_FILE=counter.conf
MAIN_SERVICE_FILE=counter.service
SERVICE_DIR=/lib/systemd/system/

echo "installing counter service"

cp bin/$MAIN_PROGRAM_FILE $INSTALL_DIR
cp $MAIN_CONFIG_FILE $CONFIGURATION_INSTALL_DIR
cp ./$MAIN_SERVICE_FILE $SERVICE_DIR

echo "done"
