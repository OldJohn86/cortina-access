CROSS_COMPILE=mips-elf- make -f Makefile.mips MBEDTLS_DIR=../mbedtls TRUSTED_BOARD_BOOT=1 \
GENERATE_COT=1 BL33=../ca-u-boot/u-boot.bin \
CORTINA_SATURN_ASIC=1 CORTINA_SATURN_ASIC_OFFICIAL=1 \
ARM_ROTPK_LOCATION=regs \
JTAG_DEBUG=1 \
CORTINA_SATURN2_SOC=1 \
ROT_KEY=../ca82xx-devel/ATF/TBB/development_keys/saturn_rotprivk_rsa.pem \
V=1 PLAT=saturn_fpga all fip clean
