#!/bin/bash

# Latest date: 2020-09-15

BUILD_DIR=g3_yocto
LOG_FILE="g3_dailybuild.txt"
TAIL_FILE="./tail.txt"
DayTimeTag=$(date "+%Y%m%d")
MonTimeTag=$(date "+%Y%m")
YestTag=$(date -d '3 days ago' +%Y%m%d)
WORK_DIR=/space/pchen/cortina-access/g3/

cd $WORK_DIR
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/yocto $BUILD_DIR-$DayTimeTag
cd $BUILD_DIR-$DayTimeTag
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/openembedded/meta-openembedded
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/openembedded/meta-virtualization
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/meta-oe-yocto-cortina
git clone -b ca-zeus-master gitolite@cs-local-gitmirror:sw/platforms/cs-unified/distro/meta-ca-bsp
export TEMPLATECONF=meta-ca-bsp/conf/g3-eng/
source ./oe-init-build-env

# Make build
bitbake major-image &> $WORK_DIR/$LOG_FILE &
