# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=StormBreaker Kernel
maintainer.string1=Murtaza Piplod TG:@mtpiplod XDA:@murtaza1326
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=sweet
device.name2=sweetin
supported.versions=11
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel install
dump_boot;

# begin ramdisk changes
# end ramdisk changes

write_boot;
## end install

