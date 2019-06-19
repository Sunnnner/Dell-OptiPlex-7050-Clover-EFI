# OptiPlex 7050 Clover
Clover for OptiPlex 7050 with Kaby Lake CPU & IGPU

Only fix the Graphics by whatevergreen, Ethernet, USB, and sound card with AppleALC, but, is enough! Less is more.

### FAQ
1. SIP enable default ?

   Yes. It way enabled by "config.plist/RtVariables/CsrActiveConfig=0x11".
2. What should we do before install macOS system upgrade ? eg.upgrade from 10.14.4 to 10.14.5
  
   Maybe you need to disable SIP before doing upgrade: Set "config.plist/RtVariables/CsrActiveConfig=0x67".

### Credits
- Apple
- Dell
