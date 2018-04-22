include ../makefile.common

CFLAGSlib+=-c
USER = $(shell pwd)

src += ./*.c
src += ./*.s
obj = ./*.o 
.PHONY :obj

libapp.a : $(obj)
	$(AR) cr $@ \
	$^

$(obj):
	$(CC) $(CFLAGSlib) \
	-I../include \
	-I../STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Inc \
	-I../STM32Cube_FW_F4_V1.10.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include \
	-I../STM32Cube_FW_F4_V1.10.0/Drivers/CMSIS/Include \
	$(src)

.PHONY :clean
clean :
	rm libapp.a  $(obj)

	
	
