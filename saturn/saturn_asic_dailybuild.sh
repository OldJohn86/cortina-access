#!/bin/bash

BUILD_DIR=saturn_yocto
LOG_FILE="saturn_sfu_dailybuild.txt"
TAIL_FILE="./tail.txt"
CurTime=$(date "+%Y%m%d")
TimeTag=$(date "+%Y%m%d")
YestTag=$(date -d '2 days ago' +%Y%m%d)
WORK_DIR=/space/pchen/cortina-access/saturn/

cd $WORK_DIR

git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/yocto $BUILD_DIR-$TimeTag
cd $BUILD_DIR-$TimeTag
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/openembedded/meta-openembedded
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/meta-oe-yocto-cortina
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/meta-ca-bsp
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/realtek/meta-realtek
cd $WORK_DIR/$BUILD_DIR-$TimeTag
export TEMPLATECONF=meta-ca-bsp/conf/saturn-sfu-eng
source ./oe-init-build-env
bitbake major-image > $WORK_DIR/$LOG_FILE &

