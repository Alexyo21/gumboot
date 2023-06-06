ifeq ($(strip $(DEVKITPPC)),)
$(error "Set devkitPPC in your environment.")
endif

PREFIX = $(DEVKITPPC)/bin/powerpc-elf-

CFLAGS = -mcpu=750 -mpaired -m32 -mhard-float -mno-eabi -mno-sdata
CFLAGS += -ffreestanding -ffunction-sections
CFLAGS += -Wall -Wextra -Os -pipe
ASFLAGS =
LDFLAGS = -mcpu=750 -m32 -n -nostartfiles -nodefaultlibs -Wl,-gc-sections

