# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=StormBreaker Kernel
maintainer.string1=Forenche TG:@YouAFuckinHoe
maintainer.string2=Saalim Quadri, Team StormBreaker Head
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=RMX1851
device.name2=rmx1851
device.name3=Realme 3 Pro
device.name4=realme 3 pro
supported.versions=10-11
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
dump_boot;

# begin ramdisk changes
# end ramdisk changes

write_boot;
## end install

