#!/bin/bash
set -o errexit -o pipefail -o nounset

RUN_DIR=/var/vcap/sys/run/vmware-player
LOG_DIR=/var/vcap/sys/log/vmware-player

mkdir -p $RUN_DIR $LOG_DIR
chown -R vcap:vcap $RUN_DIR $LOG_DIR

cd /var/vcap/packages/vmware-player-installer

sudo mount -o remount,exec /tmp

sudo apt -y update
sudo apt -y install libx11-6 libxinerama1 libxcursor1 libxtst6 libxi6

sudo bash VMware-Player.bundle --console --required --eulas-agreed \
  >>  $LOG_DIR/vmware-player.stdout.log \
  2>> $LOG_DIR/vmware-player.stderr.log \
;

sudo bash VMware-VIX.bundle --console --required --eulas-agreed \
  >>  $LOG_DIR/vmware-player.stdout.log \
  2>> $LOG_DIR/vmware-player.stderr.log \
;
