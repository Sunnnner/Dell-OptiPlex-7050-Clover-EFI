# OptiPlex 7050 Clover

* Specify	
	* CPU: i7-7700
	* Audio: ALC255
	* Graphics: HD630
    * Monitor: DP 4K monitor


Clover for OptiPlex 7050 with Kaby Lake CPU & IGPU

Only fix the Graphics by Bios hack, Ethernet, USB, and sound card with AppleALC, but, is enough! Less is more.

- DVMT Pre-Allocated address is 0x795, so "setup_var 0x795 0x2" to set 64MB [中文教程](https://zhuanlan.zhihu.com/p/39798235) [English](https://www.firewolf.science/2015/04/guide-intel-hd-graphics-5500-on-os-x-yosemite-10-10-3)
- Note: the DVMT fixup will lose after set BOIS to factory default!
- DVMT fix is recommend, even though whatevergreen can do some path to fix it.

## DVMT fix step
1. unzip 'EFI-shell.zip' to a `FAT32` partition of a USB disk
   
   you will see some thing like this : "/Volumes/UDISK/EFI/BOOT/bootx64.efi" 
   
   or "E:/EFI/BOOT/bootx64.efi" 
2. reboot you machine using this this USB disk in `UEFI BOOT MODE`
   
   and you will see a cmd line
3. just run `setup_var 0x795 0x2` using this cmd line

   `setup_var 0x795 0x3` (96MB) for 4K moniotr

4. fine, the graphics is ok to boot up macOS




### FAQ
1. SIP enable default ?

   Yes. It way enabled by "config.plist/RtVariables/CsrActiveConfig=0x11".
2. What should we do before install macOS system upgrade ? eg.upgrade from 10.14.4 to 10.14.5
  
   Maybe you need to disable SIP before doing upgrade: Set "config.plist/RtVariables/CsrActiveConfig=0x67".

### Credits
- Apple
- Dell
