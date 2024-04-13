#/usr/bin/sh

export DESTDIR=/home/jared/Projects/netbsd/obj/destdir
export RELEASEDIR=/home/jared/Projects/netbsd/obj/releasedir

cd src/
./build.sh -u -O ../obj -U -m amd64 -N1 -j24 kernel.gdb=DEBUG_KERNEL iso-image

cd ../ 

qemu-system-x86_64 -smp 2 -drive file=netbsd-current.img,format=raw \
                          -cdrom ./NetBSD-10.99.10-amd64.iso \
		                  -m 2048 -enable-kvm \
                          -net nic,model=rtl8139 -S -s &
