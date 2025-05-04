.SUFFIXES: .img .bin
AS = fasm

all: loader.img

.bin.img:
	cp $< $@
	truncate -s 1440k $@

.s.bin:
	${AS} $<

run: loader.img
	qemu-system-i386 -fda loader.img

clean:
	rm -f loader.img loader.bin

.PHONY: all run
