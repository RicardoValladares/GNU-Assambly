all:
	as -o boot.o boot.S
	ld -o floopy.img --oformat binary -e init -Ttext 0x7c00 -o floopy.img boot.o
	#qemu-system-i386 -fda floopy.img
	mkdir iso
	cp floopy.img iso/boot.img
	genisoimage -no-emul-boot -boot-load-size 4 -o cd.iso -b boot.img iso/
	qemu-system-i386 -cdrom cd.iso
	
