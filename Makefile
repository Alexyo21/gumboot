include broadway.mk

DEFINES = -DLACKS_SYS_TYPES_H -DLACKS_ERRNO_H -DLACKS_STDLIB_H -DLACKS_STRING_H -DLACKS_STRINGS_H -DLACKS_UNISTD_H \
	-DGUMBOOT \
	-DLODEPNG_NO_COMPILE_DISK -DLODEPNG_NO_COMPILE_ANCILLARY_CHUNKS -DLODEPNG_NO_COMPILE_CPP

LDSCRIPT = mini.ld
LIBS = -lgcc

TARGET = gumboot.elf

OBJS = realmode.o crt0.o main.o string.o sync.o time.o printf.o input.o \
	exception.o exception_2200.o malloc.o gecko.o video_low.o \
	ipc.o mini_ipc.o diskio.o font.o console.o \
	menu.o powerpc.o config.o atoi.o powerpc_elf.o log.o \
	menu_render.o console_common.o fatfs/ff.o fatfs/ffunicode.o \
	utils.o lodepng.o logo.o

include common.mk

mklogo/mklogo:
	make -C mklogo

logo.c: logo.png mklogo/mklogo
	@echo "  GENERATE   $@"
	mklogo/mklogo logo.png > logo.c

upload: $(TARGET)
	@$(WIIDEV)/bin/bootmii -p $<

.PHONY: upload mklogo/mklogo
