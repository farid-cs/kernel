.SUFFIXES: .img .bin
AS = fasm

all: hello-world.img

.bin.img:
	cp $< $@
	truncate -s 1440k $@

.s.bin:
	${AS} $<

run: hello-world.img
	qemu-system-i386 -fda hello-world.img

clean:
	rm -f hello-world.img hello-world.bin

.PHONY: all run
