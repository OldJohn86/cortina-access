#!/bin/bash

# Lasted data: 2020-09-15

BUILD_DIR=saturn2_yocto
LOG_FILE="saturn2_dailybuild.txt"
TAIL_FILE="./tail.txt"
CurTime=$(date "+%Y%m%d")
TimeTag=$(date "+%Y%m%d")
YestTag=$(date -d '2 days ago' +%Y%m%d)
WORK_DIR=/space/pchen/cortina-access/saturn2

cd $WORK_DIR
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/yocto  $BUILD_DIR-$TimeTag
cd $BUILD_DIR-$TimeTag
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/openembedded/meta-openembedded
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/meta-oe-yocto-cortina
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/meta-ca-bsp
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/realtek/meta-realtek
export TEMPLATECONF=meta-ca-bsp/conf/saturn2-sfu-eng
source ./oe-init-build-env

#Make build
bitbake major-image  &> $WORK_DIR/$LOG_FILE &

