CC = iccavr
CFLAGS =  -e -D__ICC_VERSION="7.14" -DATMEGA -D_EE_EXTIO -DATMega2560  -l -g -Mavr_extended -Wf-use_elpm 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -g -e:0x40000 -xcall -ucrtatmega.o -bfunc_lit:0xe4.0x10000 -dram_end:0x21ff -bdata:0x200.0x21ff -dhwstk_size:16 -beeprom:0.4096 -fihx_coff -S2
FILES = main.o gait.o hexapod.o hexapod_basic.o hexapod_motions.o keyboard.o 

HEXAPOD_CODE_VER_7_MOTION_DEMO:	$(FILES)
	$(CC) -o HEXAPOD_CODE_VER_7_MOTION_DEMO $(LFLAGS) @HEXAPOD_CODE_VER_7_MOTION_DEMO.lk   -lcatm256
main.o: C:\PROGRA~1\iccv7avr\include\iom2560v.h C:\PROGRA~1\iccv7avr\include\macros.h D:\BUILDI~1\hexapod_macro.h D:\BUILDI~1\hexapod.h D:\BUILDI~1\hexapod_basic.h D:\BUILDI~1\hexapod_motions.h D:\BUILDI~1\gait.h D:\BUILDI~1\keyboard.h
main.o:	D:\BUILDI~1\main.c
	$(CC) -c $(CFLAGS) D:\BUILDI~1\main.c
gait.o: D:\BUILDI~1\hexapod_macro.h D:\BUILDI~1\hexapod_basic.h D:\BUILDI~1\hexapod.h
gait.o:	D:\BUILDI~1\gait.c
	$(CC) -c $(CFLAGS) D:\BUILDI~1\gait.c
hexapod.o: C:\PROGRA~1\iccv7avr\include\iom2560v.h C:\PROGRA~1\iccv7avr\include\macros.h D:\BUILDI~1\hexapod_macro.h D:\BUILDI~1\keyboard.h
hexapod.o:	D:\BUILDI~1\hexapod.c
	$(CC) -c $(CFLAGS) D:\BUILDI~1\hexapod.c
hexapod_basic.o: D:\BUILDI~1\hexapod_macro.h D:\BUILDI~1\hexapod.h
hexapod_basic.o:	D:\BUILDI~1\hexapod_basic.c
	$(CC) -c $(CFLAGS) D:\BUILDI~1\hexapod_basic.c
hexapod_motions.o: D:\BUILDI~1\hexapod_macro.h D:\BUILDI~1\hexapod_basic.h D:\BUILDI~1\hexapod.h
hexapod_motions.o:	D:\BUILDI~1\hexapod_motions.c
	$(CC) -c $(CFLAGS) D:\BUILDI~1\hexapod_motions.c
keyboard.o: D:\BUILDI~1\hexapod_macro.h D:\BUILDI~1\hexapod.h D:\BUILDI~1\gait.h D:\BUILDI~1\hexapod_motions.h D:\BUILDI~1\hexapod_basic.h
keyboard.o:	D:\BUILDI~1\keyboard.c
	$(CC) -c $(CFLAGS) D:\BUILDI~1\keyboard.c
