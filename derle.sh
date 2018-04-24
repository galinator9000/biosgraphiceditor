#!/bin/bash
nasm -f bin ana.asm -o ana.img && echo "[+] Derleme başarılı."

if [ "$1" = "usb" ]; then
	sudo dd if=ana.img of=/dev/$2 && echo "[+] USB'ye başarıyla yazıldı."
	sudo umount /media/kernel/X86BOOT

elif [ "$1" = "usbvm" ]; then
	sudo dd if=ana.img of=/dev/$2 && echo "[+] USB'ye başarıyla yazıldı."
	sudo VBoxManage internalcommands createrawvmdk -filename ana.vmdk -rawdisk /dev/$2 && echo "[*] VMDK oluşturuldu." && echo "[*] VMBox başlatılıyor.." && sudo virtualbox
	sudo rm -rf ana.vmdk

elif [ "$1" = "usbqemu" ]; then
	sudo dd if=ana.img of=/dev/$2 && echo "[+] USB'ye başarıyla yazıldı."
	echo "[*] QEMU USB üzerinden çalıştırılıyor.." && sudo qemu-system-i386 -usb -usbdevice disk:/dev/$2

elif [ "$1" = "zip" ]; then
	rm Kernel.tar.gz
	tar cvf Kernel.tar.gz * && echo "[+] Arşiv başarıyla alındı."

else
	echo "[*] QEMU ham dosya üzerinden çalıştırılıyor.."
	qemu-system-i386 -cpu coreduo -drive format=raw,file=ana.img -m 256M
fi;
