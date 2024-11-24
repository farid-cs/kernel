.SUFFIXES: .img .bin
AS = fasm

all: kernel.img

.bin.img:
	cp $< $@
	truncate -s 1440k $@

.s.bin:
	${AS} $< $@

run:
	qemu-system-i386 -fda kernel.img

clean:
	rm -f kernel.img kernel.bin

.PHONY: all run
