# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=StormBreaker Kernel
maintainer.string1=ItsVixano TG:@GiovanniRN5
maintainer.string2=Saalim Quadri, Team StormBreaker Head
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=ysl
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## General tuning
# Let's install the script
ui_print "- Installing on-boot execution script"
mount -o remount,rw /vendor
cp /tmp/anykernel/tools/ysl_exec.sh /vendor/bin/
chmod u+x /vendor/bin/ysl_exec.sh

# Check if the script is present
is_exist_post_sh=$(grep ysl_exec /vendor/bin/init.qcom.post_boot.sh)
is_exist_qcom_sh=$(grep ysl_exec /vendor/bin/init.qcom.sh)

if [[ -z "$is_exist_post_sh" ]]; then
    echo "/vendor/bin/ysl_exec.sh" >> /vendor/bin/init.qcom.post_boot.sh
    ui_print "- Script installed on /vendor/bin/init.qcom.post_boot.sh"
else
    ui_print "- Script already exist on /vendor/bin/init.qcom.post_boot.sh"
fi

if [[ -z "$is_exist_qcom_sh" ]]; then
    echo "/vendor/bin/ysl_exec.sh" >> /vendor/bin/init.qcom.sh
    ui_print "- Script installed on /vendor/bin/init.qcom.sh"
else
    ui_print "- Script already exist on /vendor/bin/init.qcom.sh"
fi

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

## AnyKernel install
dump_boot;

write_boot;
## end install
