# general Makefile

include makefile.common
LDFLAGS=$(COMMONFLAGS) -fno-exceptions -ffunction-sections -fdata-sections -L$(LIBDIR) -nostartfiles -Wl,--gc-sections,-TSTM32F407VGTx_FLASH.ld

LDLIBS+=-lstm32
LDLIBS+=-lapp

all: user STM32Cube_FW_F4_V1.10.0
	$(CC) -o $(PROGRAM).elf $(LDFLAGS) \
		-Wl,--whole-archive \
		user/libapp.a \
		-Wl,--no-whole-archive \
		$(LDLIBS)
	$(OBJCOPY) -O ihex $(PROGRAM).elf $(PROGRAM).hex
	$(OBJCOPY) -O binary $(PROGRAM).elf $(PROGRAM).bin
	#Extract info contained in ELF to readable text-files:
	arm-none-eabi-readelf -a $(PROGRAM).elf > $(PROGRAM).info_elf
	arm-none-eabi-size -d -B -t $(PROGRAM).elf > $(PROGRAM).info_size
	arm-none-eabi-objdump -S $(PROGRAM).elf > $(PROGRAM).info_code
	arm-none-eabi-nm -t d -S --size-sort -s $(PROGRAM).elf > $(PROGRAM).info_symbol

STM32Cube_FW_F4_V1.10.0:
	$(MAKE) -C STM32Cube_FW_F4_V1.10.0 $@
user:
	$(MAKE) -C user $@

.PHONY: clean

# 总控的makefile使用$(MAKE)这个宏调用，子目录下的makefile
# 这里的意思是先进入-C之后的目录中然后执行该目录下的makefile

clean:
	rm $(PROGRAM).* 
