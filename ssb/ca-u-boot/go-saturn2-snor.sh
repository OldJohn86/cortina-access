# for 2020.04
make V=1 CROSS_COMPILE=mips-linux- cortina_saturn2-engboard-nor_defconfig
make V=1 CROSS_COMPILE=mips-linux- -j12
