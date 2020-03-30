# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

properties() { '
kernel.string=Kernel from Stormbreaker-projects
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=1
device.name1=
device.name2=
s upported.versions=
supported.patchlevels=
'; }

block=auto;
is_slot_device=auto;
ramdisk_compression=auto;

. tools/ak3-core.sh;

dump_boot;
write_boot;
