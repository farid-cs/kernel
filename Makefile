.SUFFIXES: .img .bin
AS = fasm

all: boot.img

.bin.img:
	cp $< $@
	truncate -s 1440k $@

.s.bin:
	${AS} $<

run: boot.img
	qemu-system-i386 -fda boot.img

clean:
	rm -f boot.img boot.bin

.PHONY: all run
