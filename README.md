# guix-pinephone

An diesem Projekt wird nicht mehr gearbeitet!  

Der "linux" kernel stammt von [nonguix](https://gitlab.com/nonguix/nonguix) und ist NICHT Teil des Guix projektes mit ihm funktionieren (meistens):
* Bildschirm  
* USB  

Der linux-libre-arm64-generic kernel bootet aber gibt keinen Display output.  
Meistens funktioniert die usb buchse.

Die bootloader sektion ist nicht funktional zum booten muss [u-boot](https://wiki.pine64.org/wiki/Uboot)  
gebaut und per Hand auf die zu bootende generation gerichtet werden.  

# 2do:  
- [x] Guix offload (auf 2*Odroid N2+)  
- [ ] guix offload (auf Maschine mit mehr ram)  
- [ ] uart-debugger kaufen  
- [ ] english translation
