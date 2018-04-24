cd C:\Users\Netkafem\Desktop
nasm -f bin ana.asm -o ana.img
qemu-system-i386 -cpu coreduo -drive format=raw,file=ana.img -m 256M
