# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=StormBreaker Kernel for Surya
maintainer.string1=Forenche TG: @GigaChadCat
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=surya
device.name2=karna
supported.versions=10-15
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel install
split_boot;
flash_boot;
flash_dtbo;
## end install
