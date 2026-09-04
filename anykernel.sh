### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Android Kernel by 闲鱼搞机英雄
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1


# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh

ui_print "内核构建者: 闲鱼搞机英雄"
ui_print " "
ui_print "1. 本内核为个人业余编译，仅供"
ui_print "   学习、研究与技术交流使用。"
ui_print " "
ui_print "2. 刷机存在风险: 可能导致无法开机、变砖、"
ui_print "   数据丢失、硬件损坏、发热耗电异常、失去"
ui_print "   保修资格、无法接收官方 OTA 更新。"
ui_print "   一切后果由刷入者自行承担，构建者不承担"
ui_print "   任何直接或间接责任，亦不提供任何形式的"
ui_print "   质量保证或售后担保。"
ui_print " "
ui_print "3. 切勿用作非法用途。严禁将本内核用于任何"
ui_print "   违法违规活动，包括但不限于游戏作弊、"
ui_print "   破解他人软件、非法采集或窃取数据、"
ui_print "   侵入他人设备等。由此产生的法律责任由"
ui_print "   使用者本人承担。"
ui_print " "
ui_print "4. 继续刷入即表示你已完整阅读并同意以上全部"
ui_print "   条款; 若不同意, 请立即中止安装。"

split_boot # for devices with init_boot ramdisk
if [ -f "$SPLITIMG/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi

## end boot install
