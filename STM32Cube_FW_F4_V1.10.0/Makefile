# libs Makefile
include ../makefile.common
CFLAGSlib+=-c

STM32LIB = $(shell pwd)

obj1 = $(STM32LIB)/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/*.o
obj2 = $(STM32LIB)/Drivers/STM32F4xx_HAL_Driver/Src/*.o
inc1 = $(STM32LIB)/Drivers/STM32F4xx_HAL_STM32LIB/Inc
inc2 = $(STM32LIB)/Drivers/CMSIS/Device/ST/STM32F4xx/Include/
inc3 = $(STM32LIB)/Drivers/CMSIS/Include
inc4 = $(STM32LIB)/Drivers/STM32F4xx_HAL_Driver/Inc

libstm32.a: $(obj1) $(obj2)
	echo "comlile stm32lib.a"
	$(AR) cr $(STM32LIB)/Drivers/$@ $^
	echo "make stm32lib success"

$(obj1) :
	echo "comlile obj1"
	cd $(STM32LIB)/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/ && \
	$(CC) $(CFLAGSlib) \
		-I$(inc1) -I$(inc2) -I$(inc3) \
		system_stm32f4xx.c

$(obj2) :
	echo "comlile obj2"
	cd $(STM32LIB)/Drivers/STM32F4xx_HAL_Driver/Src && \
	$(CC) $(CFLAGSlib) \
		-I$(inc4) -I$(inc2) -I$(inc3) \
		-I../../../../include \
		*.c

.PHONY: clean 
clean:
	rm -f $(STM32LIB)/Drivers/libstm32.a $(obj1) $(obj2)
