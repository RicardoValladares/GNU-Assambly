all:
	as -o boot.o boot.S
	ld -o boot.img --oformat binary -e init -Ttext 0x7c00 -o boot.img boot.o
	qemu-system-i386 -fda boot.img
