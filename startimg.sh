#!/bin/sh

## convert image to qed:
# qemu-img convert -p -t writeback -O qed source_image.img output_image.img

if [ $# -eq 0 ]; then
	echo "usage: $0 <harddisk imgage> [ <cd image> ]"
	exit 1
elif [ $# -eq 2 ]; then
	echo "starting with cdrom '$2'"
	qemu-kvm -drive file=$1,index=0,media=disk,cache=none\
		 -cdrom $2\
		 -daemonize\
		 -smp 2\
		 -boot c\
		 -net nic -net user\
		 -soundhw hda\
		 -m 3072\
		 -rtc base=localtime\
		 -spice port=5566,disable-ticketing\
		 -vga qxl\
		 -device virtio-serial\
		 -chardev spicevmc,id=vdagent,name=vdagent\
		 -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
else
	echo "starting without cdrom"
	qemu-kvm -drive file=$1,index=0,media=disk,cache=none\
		 -daemonize\
		 -smp 2\
		 -boot c\
		 -net nic -net user\
		 -soundhw hda\
		 -m 3072\
		 -rtc base=localtime\
		 -spice port=5566,disable-ticketing\
		 -vga qxl\
		 -device virtio-serial\
		 -chardev spicevmc,id=vdagent,name=vdagent\
		 -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
fi


sleep 2; spicy -h localhost -p 5566 &
