#!/bin/sh

if [ $# -eq 1 ]; then
	echo "starting with cdrom '$1'"
	qemu-kvm -cdrom $1\
		 -daemonize\
		 -smp 2\
		 -boot c\
		 -net nic -net user\
		 -soundhw hda\
		 -m 3072\
		 -rtc base=localtime\
		 -spice port=5588,disable-ticketing\
		 -vga qxl\
		 -device virtio-serial\
		 -chardev spicevmc,id=vdagent,name=vdagent\
		 -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
else
	echo "please specify an iso to boot.."
	exit 1
fi


sleep 2; spicy -h localhost -p 5588 &
