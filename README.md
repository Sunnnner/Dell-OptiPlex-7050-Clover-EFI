# OptiPlex 7050 Clover

* Specify	
	* CPU: i7-7700
	* Audio: ALC255
	* Graphics: HD630
    * Monitor: DP 4K monitor


Clover for OptiPlex 7050 with Kaby Lake CPU & IGPU

Only fix the Graphics by modify UEFI variables, Ethernet, USB, and sound card with AppleALC, but, is enough! Less is more.

## UEFI Variables

In order to run macOS successfully a number of EFI BIOS variables need to be modified. The included Clover bootloader contains an updated `DVMT.efi`, which includes a `setup_var` command to help do just that.

`DVMT.efi` can be launched from Clover directly by renaming it to `Shell64U.efi` in the `tools` folder.

The following variables need to be updated:

| Variable              | Offset | Default value  | Desired value   | Comment                                                    |
|-----------------------|--------|----------------|-----------------|------------------------------------------------------------|
| CFG Lock              | 0x4ED   | 0x01 (Enabled) | 0x00 (Disabled) | Disable CFG Lock to prevent MSR 0x02 errors on boot        |
| DVMT Pre-allocation   | 0x795  | 0x01 (32M)     | 0x04 (128M)     | Increase DVMT pre-allocated size to 128M for 2K+ displays  |

## Modify DVMT variable step

1. Start up and enter `Clover boot menu`, select `Start UEFI shell 64` and enter.

   I has replace `Shell64U.ef` with `DVMT.efi`, so you are running `DVMT.efi` in fact.

3. just run `setup_var 0x795 0x4` using this cmd line

4. fine, the graphics is ok to boot up macOS

5. Note: the UEFI Variables will lose after set BOIS to factory default!

### FAQ
1. SIP enable default ?

   Yes. It way enabled by "config.plist/RtVariables/CsrActiveConfig=0x11".
2. What should we do before install macOS system upgrade ? eg.upgrade from 10.14.4 to 10.14.5
  
   Maybe you need to disable SIP before doing upgrade: Set "config.plist/RtVariables/CsrActiveConfig=0x67".

### Credits
- Apple
- Dell

### update
1. update clover and kexts
2. stand by MacOs 10.14.6 (18G103)