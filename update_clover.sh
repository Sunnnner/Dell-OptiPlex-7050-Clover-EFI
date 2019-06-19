#!/bin/sh

# Download the iso from "https://sourceforge.net/projects/cloverefiboot/files/Bootable_ISO/" and mount it.
# Then run this shell

CLOVER=/Volumes/Clover-v2.4k-4945-X64
if [ ! -d $CLOVER ]; then 
   echo "$CLOVER not exists!"
   exit 1
fi

cp -pR $CLOVER /tmp/Clover
CLOVER=/tmp/Clover

# merge 'drivers-Off/drivers64UEF' to 'drivers64UEFI'
cp -pR $CLOVER/EFI/CLOVER/drivers-Off/drivers64UEFI/* $CLOVER/EFI/CLOVER/drivers64UEFI/

EFI=`pwd`

file_list=(
EFI/BOOT/BOOTX64.efi 
EFI/CLOVER/CLOVERX64.efi 
EFI/CLOVER/drivers64UEFI/OsxAptioFix3Drv-64.efi
EFI/CLOVER/drivers64UEFI/FSInject-64.efi
EFI/CLOVER/drivers64UEFI/ApfsDriverLoader-64.efi
EFI/CLOVER/drivers64UEFI/SMCHelper-64.efi
EFI/CLOVER/drivers64UEFI/EmuVariableUefi-64.efi 
)

for filename in ${file_list[@]}
do 
	cp -p $CLOVER/$filename $EFI/$filename
done

cp -pR $CLOVER/EFI/CLOVER/tools/*       $EFI/EFI/CLOVER/tools

rm -rf $CLOVER

echo "sync from $CLOVER to $EFI finish"

