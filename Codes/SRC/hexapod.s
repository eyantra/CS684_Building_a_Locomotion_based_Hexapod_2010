	.module hexapod.c
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
_arm_number::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbsym e arm_number _arm_number c
_angle_upper_byte::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbsym e angle_upper_byte _angle_upper_byte c
_angle_lower_byte::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbsym e angle_lower_byte _angle_lower_byte c
_degree::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbsym e degree _degree c
_delay_count::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbsym e delay_count _delay_count i
_serial_communication_interval::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbsym e serial_communication_interval _serial_communication_interval i
_serial_communication_channel_number::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbsym e serial_communication_channel_number _serial_communication_channel_number c
_motion_busy::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbsym e motion_busy _motion_busy c
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbfunc e port_init _port_init fV
	.even
_port_init::
	.dbline -1
	.dbline 127
; //ICC-AVR application builder : 11/4/2009 1:05:10 PM
; // Target : M2560
; // Crystal: 11.059Mhz
; 
; /*
;  Pin name	Port		Anding (make 0)		Oring (make 1)
;  SP LEFT	PL1		1111 1101	0xFD		0000 0010	0x02
; 
;  1A		PD5		1101 1111	0xDF		0010 0000	0x20
;  1B		PL2		1111 1011	0xFB		0000 0100	0x04
;  1C		PG1		1111 1101	0xFD		0000 0010	0x02
;  2A		PL6		1011 1111	0xBF		0100 0000	0x40
;  2B		PD4		1110 1111	0xEF		0001 0000	0x10
;  2C		PL7		0111 1111	0x7F		1000 0000	0x80
;  3A		PH6		1011 1111	0xBF		0100 0000	0x40
;  3B		PH4		1110 1111	0xEF		0001 0000	0x10
;  3C		PH5		1101 1111	0xDF		0010 0000	0x20
;  SP RIGHT	PJ7		0111 1111	0x7F		1000 0000	0x80
;  4A		PG0		1111 1110	0xFE		0000 0001	0x01
;  4B		PD7		0111 1111	0x7F		1000 0000	0x80
;  4C		PD6		1011 1111	0xBF		0100 0000	0x40
;  5A		PJ5		1101 1111	0xDF		0010 0000	0x20
;  5B		PJ6		1011 1111	0xBF		0100 0000	0x40
;  5C		PJ4		1110 1111	0xEF		0001 0000	0x10
;  6A		PJ3		1111 0111	0XF7		0000 1000	0x08
;  6B		PJ1		1111 1101	0xFD		0000 0010	0x02
;  6C		PJ2		1111 1011	0xFB		0000 0100	0x04
; 
;  Remote control communication protocoal
;  transmitted command		received data
;  1						right joystick x axis 8 bit analog position;	center:0x24; left: 0x3B; right: 0x04
;  2						right joystick y axis 8 bit analog position;	center:0x24; up: 0x3B; down: 0x04
;  3						left joystick x axis 8 bit analog position;		center:0x3A; left: 0x23; right: 0x04
;  4						left joystick y axis 8 bit analog position;		center:0x1F; up: 0x34; down: 0x04
;  5						right joystick button
;  6						left joystick button
;  7						digital switches left 1,2 and right 1,2
;  bit7: Right 2; bit6: right 1; bit4: left 1; bit3: left 2
; 
;  Received data will be stored in the array unsigned char remote_data [8]; from the location 1 to 7 in the same order as the command.
;  */
;  
;  
;  /*********************************************************************************
; 
;    Copyright (c) 2010, ERTS Lab IIT Bombay erts@cse.iitb.ac.in               -*- c -*-
;    All rights reserved.
; 
;    Redistribution and use in source and binary forms, with or without
;    modification, are permitted provided that the following conditions are met:
; 
;    * Redistributions of source code must retain the above copyright
;      notice, this list of conditions and the following disclaimer.
; 
;    * Redistributions in binary form must reproduce the above copyright
;      notice, this list of conditions and the following disclaimer in
;      the documentation and/or other materials provided with the
;      distribution.
; 
;    * Neither the name of the copyright holders nor the names of
;      contributors may be used to endorse or promote products derived
;      from this software without specific prior written permission.
; 
;    * Source code can be used for academic purpose. 
; 	 For commercial use permission form the author needs to be taken.
; 
;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;   POSSIBILITY OF SUCH DAMAGE. 
; 
;   Software released under Creative Commence cc by-nc-sa licence.
;   For legal information refer to: 
;   http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode
; 
; ********************************************************************************/
; 
; 
; #include <iom2560v.h>
; #include <macros.h>
; #include "hexapod_macro.h"
; #include "keyboard.h"
; 
; 
; unsigned char arm_number = 0;
; unsigned char angle_upper_byte = 0;
; unsigned char angle_lower_byte = 0;
; unsigned char degree = 0;
; unsigned char angle_upper_byte_1A, angle_lower_byte_1A;
; angle_upper_byte_1B, angle_lower_byte_1B; angle_upper_byte_1C, angle_lower_byte_1C;
; unsigned char angle_upper_byte_2A, angle_lower_byte_2A;
; angle_upper_byte_2B, angle_lower_byte_2B; angle_upper_byte_2C, angle_lower_byte_2C;
; unsigned char angle_upper_byte_3A, angle_lower_byte_3A;
; angle_upper_byte_3B, angle_lower_byte_3B; angle_upper_byte_3C, angle_lower_byte_3C;
; unsigned char angle_upper_byte_4A, angle_lower_byte_4A;
; angle_upper_byte_4B, angle_lower_byte_4B; angle_upper_byte_4C, angle_lower_byte_4C;
; unsigned char angle_upper_byte_5A, angle_lower_byte_5A;
; angle_upper_byte_5B, angle_lower_byte_5B; angle_upper_byte_5C, angle_lower_byte_5C;
; unsigned char angle_upper_byte_6A, angle_lower_byte_6A;
; angle_upper_byte_6B, angle_lower_byte_6B; angle_upper_byte_6C, angle_lower_byte_6C;
; unsigned int delay_count = 0;
; //variables relatd to the serial commuication or remote control
; unsigned int serial_communication_interval = 0;
; unsigned char serial_communication_channel_number = 0;
; unsigned char remote_data[8]; //see remote channel allocation in the notes above
; unsigned char motion_busy = 0; //sets to one if any of the motion function is called.
; 
; unsigned char data;
; 
; 
; 
; void delay(int time);
; void swap(unsigned char *a, unsigned char *b);
; void buzzer_on(void);
; void buzzer_off(void);
; 
; /**
; Port Initialization
; */
; void port_init(void) {
	.dbline 128
; 	PORTA = 0x00;
	clr R2
	out 0x2,R2
	.dbline 129
; 	DDRA = 0xFF;
	ldi R24,255
	out 0x1,R24
	.dbline 130
; 	PORTB = 0x00;
	out 0x5,R2
	.dbline 131
; 	DDRB = 0x01;
	ldi R24,1
	out 0x4,R24
	.dbline 132
; 	PORTC = 0x00; //m103 output only
	out 0x8,R2
	.dbline 133
; 	DDRC = 0xFF;
	ldi R24,255
	out 0x7,R24
	.dbline 134
; 	PORTD = 0x00;
	out 0xb,R2
	.dbline 135
; 	DDRD = 0xF0;
	ldi R24,240
	out 0xa,R24
	.dbline 136
; 	PORTE = 0x00;
	out 0xe,R2
	.dbline 137
; 	DDRE = 0x00;
	out 0xd,R2
	.dbline 138
; 	PORTF = 0x00;
	out 0x11,R2
	.dbline 139
; 	DDRF = 0x00;
	out 0x10,R2
	.dbline 140
; 	PORTG = 0x00;
	out 0x14,R2
	.dbline 141
; 	DDRG = 0x03;
	ldi R24,3
	out 0x13,R24
	.dbline 142
; 	PORTH = 0x00;
	sts 258,R2
	.dbline 143
; 	DDRH = 0x70;
	ldi R24,112
	sts 257,R24
	.dbline 144
; 	PORTJ = 0x00;
	sts 261,R2
	.dbline 145
; 	DDRJ = 0xFE; //0xFE original
	ldi R24,254
	sts 260,R24
	.dbline 146
; 	PORTK = 0x00;
	sts 264,R2
	.dbline 147
; 	DDRK = 0x00;
	sts 263,R2
	.dbline 148
; 	PORTL = 0x00;
	sts 267,R2
	.dbline 149
; 	DDRL = 0xC7;
	ldi R24,199
	sts 266,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e timer1_init _timer1_init fV
	.even
_timer1_init::
	.dbline -1
	.dbline 156
; }
; 
; //TIMER1 initialize - prescale:1
; // WGM: 0) Normal, TOP=0xFFFF
; // desired value: 400Hz
; // actual value: 400.007Hz (0.0%)
; void timer1_init(void) {
	.dbline 157
; 	TCCR1B = 0x00; //stop
	clr R2
	sts 129,R2
	.dbline 158
; 	TCNT1H = 0x94; //setup
	ldi R24,148
	sts 133,R24
	.dbline 159
; 	TCNT1L = 0x01;
	ldi R24,1
	sts 132,R24
	.dbline 160
; 	OCR1AH = 0x6B;
	ldi R24,107
	sts 137,R24
	.dbline 161
; 	OCR1AL = 0xFF;
	ldi R24,255
	sts 136,R24
	.dbline 162
; 	OCR1BH = 0x6B;
	ldi R24,107
	sts 139,R24
	.dbline 163
; 	OCR1BL = 0xFF;
	ldi R24,255
	sts 138,R24
	.dbline 164
; 	OCR1CH = 0x00;
	sts 141,R2
	.dbline 165
; 	OCR1CL = 0x00;
	sts 140,R2
	.dbline 166
; 	ICR1H = 0x6B;
	ldi R24,107
	sts 135,R24
	.dbline 167
; 	ICR1L = 0xFF;
	ldi R24,255
	sts 134,R24
	.dbline 168
; 	TCCR1A = 0x00;
	sts 128,R2
	.dbline 169
; 	TCCR1C = 0x00;
	sts 130,R2
	.dbline 170
; 	TCCR1B = 0x01; //start Timer
	ldi R24,1
	sts 129,R24
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e turn_on_sharp15 _turn_on_sharp15 fV
	.even
_turn_on_sharp15::
	.dbline -1
	.dbline 175
; }
; 
; 
; void turn_on_sharp15 (void) //turn on Sharp IR range sensors 1,5
; {
	.dbline 176
;   PORTH = PORTH & 0xFB;
	lds R24,258
	andi R24,251
	sts 258,R24
	.dbline -2
L3:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e turn_off_sharp15 _turn_off_sharp15 fV
	.even
_turn_off_sharp15::
	.dbline -1
	.dbline 180
; }
; 
; void turn_off_sharp15 (void) //turn off Sharp IR range sensors 1,5
; {
	.dbline 181
;  PORTH = PORTH | 0x04;
	lds R24,258
	ori R24,4
	sts 258,R24
	.dbline -2
L4:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_1A _reset_1A fV
	.even
_reset_1A::
	.dbline -1
	.dbline 184
; }
; 
; void reset_1A(void) {
	.dbline 185
; 	PORTD = PORTD & 0xDF;
	in R24,0xb
	andi R24,223
	out 0xb,R24
	.dbline -2
L5:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_1A _set_1A fV
	.even
_set_1A::
	.dbline -1
	.dbline 188
; }
; 
; void set_1A(void) {
	.dbline 189
; 	PORTD = PORTD | 0x20;
	sbi 0xb,5
	.dbline -2
L6:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_1B _reset_1B fV
	.even
_reset_1B::
	.dbline -1
	.dbline 192
; }
; 
; void reset_1B(void) {
	.dbline 193
; 	PORTL = PORTL & 0xFB;
	lds R24,267
	andi R24,251
	sts 267,R24
	.dbline -2
L7:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_1B _set_1B fV
	.even
_set_1B::
	.dbline -1
	.dbline 196
; }
; 
; void set_1B(void) {
	.dbline 197
; 	PORTL = PORTL | 0x04;
	lds R24,267
	ori R24,4
	sts 267,R24
	.dbline -2
L8:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_1C _reset_1C fV
	.even
_reset_1C::
	.dbline -1
	.dbline 200
; }
; 
; void reset_1C(void) {
	.dbline 201
; 	PORTG = PORTG & 0xFD;
	in R24,0x14
	andi R24,253
	out 0x14,R24
	.dbline -2
L9:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_1C _set_1C fV
	.even
_set_1C::
	.dbline -1
	.dbline 204
; }
; 
; void set_1C(void) {
	.dbline 205
; 	PORTG = PORTG | 0x02;
	sbi 0x14,1
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_2A _reset_2A fV
	.even
_reset_2A::
	.dbline -1
	.dbline 208
; }
; 
; void reset_2A(void) {
	.dbline 209
; 	PORTL = PORTL & 0xBF;
	lds R24,267
	andi R24,191
	sts 267,R24
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_2A _set_2A fV
	.even
_set_2A::
	.dbline -1
	.dbline 212
; }
; 
; void set_2A(void) {
	.dbline 213
; 	PORTL = PORTL | 0x40;
	lds R24,267
	ori R24,64
	sts 267,R24
	.dbline -2
L12:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_2B _reset_2B fV
	.even
_reset_2B::
	.dbline -1
	.dbline 216
; }
; 
; void reset_2B(void) {
	.dbline 217
; 	PORTD = PORTD & 0xEF;
	in R24,0xb
	andi R24,239
	out 0xb,R24
	.dbline -2
L13:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_2B _set_2B fV
	.even
_set_2B::
	.dbline -1
	.dbline 220
; }
; 
; void set_2B(void) {
	.dbline 221
; 	PORTD = PORTD | 0x10;
	sbi 0xb,4
	.dbline -2
L14:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_2C _reset_2C fV
	.even
_reset_2C::
	.dbline -1
	.dbline 224
; }
; 
; void reset_2C(void) {
	.dbline 225
; 	PORTL = PORTL & 0x7F;
	lds R24,267
	andi R24,127
	sts 267,R24
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_2C _set_2C fV
	.even
_set_2C::
	.dbline -1
	.dbline 228
; }
; 
; void set_2C(void) {
	.dbline 229
; 	PORTL = PORTL | 0x80;
	lds R24,267
	ori R24,128
	sts 267,R24
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_3A _reset_3A fV
	.even
_reset_3A::
	.dbline -1
	.dbline 232
; }
; 
; void reset_3A(void) {
	.dbline 233
; 	PORTH = PORTH & 0xBF;
	lds R24,258
	andi R24,191
	sts 258,R24
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_3A _set_3A fV
	.even
_set_3A::
	.dbline -1
	.dbline 236
; }
; 
; void set_3A(void) {
	.dbline 237
; 	PORTH = PORTH | 0x40;
	lds R24,258
	ori R24,64
	sts 258,R24
	.dbline -2
L18:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_3B _reset_3B fV
	.even
_reset_3B::
	.dbline -1
	.dbline 240
; }
; 
; void reset_3B(void) {
	.dbline 241
; 	PORTH = PORTH & 0xEF;
	lds R24,258
	andi R24,239
	sts 258,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_3B _set_3B fV
	.even
_set_3B::
	.dbline -1
	.dbline 244
; }
; 
; void set_3B(void) {
	.dbline 245
; 	PORTH = PORTH | 0x10;
	lds R24,258
	ori R24,16
	sts 258,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_3C _reset_3C fV
	.even
_reset_3C::
	.dbline -1
	.dbline 248
; }
; 
; void reset_3C(void) {
	.dbline 249
; 	PORTH = PORTH & 0xDF;
	lds R24,258
	andi R24,223
	sts 258,R24
	.dbline -2
L21:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_3C _set_3C fV
	.even
_set_3C::
	.dbline -1
	.dbline 252
; }
; 
; void set_3C(void) {
	.dbline 253
; 	PORTH = PORTH | 0x20;
	lds R24,258
	ori R24,32
	sts 258,R24
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_SP_RIGHT _reset_SP_RIGHT fV
	.even
_reset_SP_RIGHT::
	.dbline -1
	.dbline 256
; }
; 
; void reset_SP_RIGHT(void) {
	.dbline 257
; 	PORTJ = PORTJ & 0x7F;
	lds R24,261
	andi R24,127
	sts 261,R24
	.dbline -2
L23:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_SP_RIGHT _set_SP_RIGHT fV
	.even
_set_SP_RIGHT::
	.dbline -1
	.dbline 260
; }
; 
; void set_SP_RIGHT(void) {
	.dbline 261
; 	PORTJ = PORTJ | 0x80;
	lds R24,261
	ori R24,128
	sts 261,R24
	.dbline -2
L24:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_4A _reset_4A fV
	.even
_reset_4A::
	.dbline -1
	.dbline 264
; }
; 
; void reset_4A(void) {
	.dbline 265
; 	PORTG = PORTG & 0xFE;
	in R24,0x14
	andi R24,254
	out 0x14,R24
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_4A _set_4A fV
	.even
_set_4A::
	.dbline -1
	.dbline 268
; }
; 
; void set_4A(void) {
	.dbline 269
; 	PORTG = PORTG | 0x01;
	sbi 0x14,0
	.dbline -2
L26:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_4B _reset_4B fV
	.even
_reset_4B::
	.dbline -1
	.dbline 272
; }
; 
; void reset_4B(void) {
	.dbline 273
; 	PORTD = PORTD & 0x7F;
	in R24,0xb
	andi R24,127
	out 0xb,R24
	.dbline -2
L27:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_4B _set_4B fV
	.even
_set_4B::
	.dbline -1
	.dbline 276
; }
; 
; void set_4B(void) {
	.dbline 277
; 	PORTD = PORTD | 0x80;
	sbi 0xb,7
	.dbline -2
L28:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_4C _reset_4C fV
	.even
_reset_4C::
	.dbline -1
	.dbline 280
; }
; 
; void reset_4C(void) {
	.dbline 281
; 	PORTD = PORTD & 0xBF;
	in R24,0xb
	andi R24,191
	out 0xb,R24
	.dbline -2
L29:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_4C _set_4C fV
	.even
_set_4C::
	.dbline -1
	.dbline 284
; }
; 
; void set_4C(void) {
	.dbline 285
; 	PORTD = PORTD | 0x40;
	sbi 0xb,6
	.dbline -2
L30:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_5A _reset_5A fV
	.even
_reset_5A::
	.dbline -1
	.dbline 288
; }
; 
; void reset_5A(void) {
	.dbline 289
; 	PORTJ = PORTJ & 0xDF;
	lds R24,261
	andi R24,223
	sts 261,R24
	.dbline -2
L31:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_5A _set_5A fV
	.even
_set_5A::
	.dbline -1
	.dbline 292
; }
; 
; void set_5A(void) {
	.dbline 293
; 	PORTJ = PORTJ | 0x20;
	lds R24,261
	ori R24,32
	sts 261,R24
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_5B _reset_5B fV
	.even
_reset_5B::
	.dbline -1
	.dbline 296
; }
; 
; void reset_5B(void) {
	.dbline 297
; 	PORTJ = PORTJ & 0xBF;
	lds R24,261
	andi R24,191
	sts 261,R24
	.dbline -2
L33:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_5B _set_5B fV
	.even
_set_5B::
	.dbline -1
	.dbline 300
; }
; 
; void set_5B(void) {
	.dbline 301
; 	PORTJ = PORTJ | 0x40;
	lds R24,261
	ori R24,64
	sts 261,R24
	.dbline -2
L34:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_5C _reset_5C fV
	.even
_reset_5C::
	.dbline -1
	.dbline 304
; }
; 
; void reset_5C(void) {
	.dbline 305
; 	PORTJ = PORTJ & 0xEF;
	lds R24,261
	andi R24,239
	sts 261,R24
	.dbline -2
L35:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_5C _set_5C fV
	.even
_set_5C::
	.dbline -1
	.dbline 308
; }
; 
; void set_5C(void) {
	.dbline 309
; 	PORTJ = PORTJ | 0x10;
	lds R24,261
	ori R24,16
	sts 261,R24
	.dbline -2
L36:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_6A _reset_6A fV
	.even
_reset_6A::
	.dbline -1
	.dbline 312
; }
; 
; void reset_6A(void) {
	.dbline 313
; 	PORTJ = PORTJ & 0xF7;
	lds R24,261
	andi R24,247
	sts 261,R24
	.dbline -2
L37:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_6A _set_6A fV
	.even
_set_6A::
	.dbline -1
	.dbline 316
; }
; 
; void set_6A(void) {
	.dbline 317
; 	PORTJ = PORTJ | 0x08;
	lds R24,261
	ori R24,8
	sts 261,R24
	.dbline -2
L38:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_6B _reset_6B fV
	.even
_reset_6B::
	.dbline -1
	.dbline 320
; }
; 
; void reset_6B(void) {
	.dbline 321
; 	PORTJ = PORTJ & 0xFD;
	lds R24,261
	andi R24,253
	sts 261,R24
	.dbline -2
L39:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_6B _set_6B fV
	.even
_set_6B::
	.dbline -1
	.dbline 324
; }
; 
; void set_6B(void) {
	.dbline 325
; 	PORTJ = PORTJ | 0x02;
	lds R24,261
	ori R24,2
	sts 261,R24
	.dbline -2
L40:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_6C _reset_6C fV
	.even
_reset_6C::
	.dbline -1
	.dbline 328
; }
; 
; void reset_6C(void) {
	.dbline 329
; 	PORTJ = PORTJ & 0xFB;
	lds R24,261
	andi R24,251
	sts 261,R24
	.dbline -2
L41:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_6C _set_6C fV
	.even
_set_6C::
	.dbline -1
	.dbline 332
; }
; 
; void set_6C(void) {
	.dbline 333
; 	PORTJ = PORTJ | 0x04;
	lds R24,261
	ori R24,4
	sts 261,R24
	.dbline -2
L42:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 68
	jmp _timer1_compa_isr
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbfunc e timer1_compa_isr _timer1_compa_isr fV
	.even
_timer1_compa_isr::
	st -y,R0
	st -y,R1
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R6
	st -y,R7
	st -y,R8
	st -y,R9
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R26
	st -y,R27
	st -y,R30
	st -y,R31
	in R0,0x3f
	st -y,R0
	.dbline -1
	.dbline 338
; }
; 
; 
; #pragma interrupt_handler timer1_compa_isr:iv_TIM1_COMPA
; void timer1_compa_isr(void) {
	.dbline 340
; 	//compare occured TCNT1=OCR1A
; 	if (arm_number == 0) {
	lds R2,_arm_number
	tst R2
	brne L44
X0:
	.dbline 340
	.dbline 341
; 		reset_1A();
	xcall _reset_1A
	.dbline 342
; 	}
L44:
	.dbline 343
; 	if (arm_number == 1) {
	lds R24,_arm_number
	cpi R24,1
	brne L46
X1:
	.dbline 343
	.dbline 344
; 		reset_2A();
	xcall _reset_2A
	.dbline 345
; 	}
L46:
	.dbline 346
; 	if (arm_number == 2) {
	lds R24,_arm_number
	cpi R24,2
	brne L48
X2:
	.dbline 346
	.dbline 347
; 		reset_3A();
	xcall _reset_3A
	.dbline 348
; 	}
L48:
	.dbline 349
; 	if (arm_number == 3) {
	lds R24,_arm_number
	cpi R24,3
	brne L50
X3:
	.dbline 349
	.dbline 350
; 		reset_4A();
	xcall _reset_4A
	.dbline 351
; 	}
L50:
	.dbline 352
; 	if (arm_number == 4) {
	lds R24,_arm_number
	cpi R24,4
	brne L52
X4:
	.dbline 352
	.dbline 353
; 		reset_5A();
	xcall _reset_5A
	.dbline 354
; 	}
L52:
	.dbline 355
; 	if (arm_number == 5) {
	lds R24,_arm_number
	cpi R24,5
	brne L54
X5:
	.dbline 355
	.dbline 356
; 		reset_6A();
	xcall _reset_6A
	.dbline 357
; 	}
L54:
	.dbline -2
L43:
	.dbline 0 ; func end
	ld R0,y+
	out 0x3f,R0
	ld R31,y+
	ld R30,y+
	ld R27,y+
	ld R26,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R9,y+
	ld R8,y+
	ld R7,y+
	ld R6,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	ld R1,y+
	ld R0,y+
	reti
	.dbend
	.area vector(rom, abs)
	.org 72
	jmp _timer1_compb_isr
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbfunc e timer1_compb_isr _timer1_compb_isr fV
	.even
_timer1_compb_isr::
	st -y,R0
	st -y,R1
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R6
	st -y,R7
	st -y,R8
	st -y,R9
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R26
	st -y,R27
	st -y,R30
	st -y,R31
	in R0,0x3f
	st -y,R0
	.dbline -1
	.dbline 361
; }
; 
; #pragma interrupt_handler timer1_compb_isr:iv_TIM1_COMPB
; void timer1_compb_isr(void) {
	.dbline 363
; 	//compare occured TCNT1=OCR1B
; 	if (arm_number == 0) {
	lds R2,_arm_number
	tst R2
	brne L57
X6:
	.dbline 363
	.dbline 364
; 		reset_1B();
	xcall _reset_1B
	.dbline 365
; 	}
L57:
	.dbline 366
; 	if (arm_number == 1) {
	lds R24,_arm_number
	cpi R24,1
	brne L59
X7:
	.dbline 366
	.dbline 367
; 		reset_2B();
	xcall _reset_2B
	.dbline 368
; 	}
L59:
	.dbline 369
; 	if (arm_number == 2) {
	lds R24,_arm_number
	cpi R24,2
	brne L61
X8:
	.dbline 369
	.dbline 370
; 		reset_3B();
	xcall _reset_3B
	.dbline 371
; 	}
L61:
	.dbline 372
; 	if (arm_number == 3) {
	lds R24,_arm_number
	cpi R24,3
	brne L63
X9:
	.dbline 372
	.dbline 373
; 		reset_4B();
	xcall _reset_4B
	.dbline 374
; 	}
L63:
	.dbline 375
; 	if (arm_number == 4) {
	lds R24,_arm_number
	cpi R24,4
	brne L65
X10:
	.dbline 375
	.dbline 376
; 		reset_5B();
	xcall _reset_5B
	.dbline 377
; 	}
L65:
	.dbline 378
; 	if (arm_number == 5) {
	lds R24,_arm_number
	cpi R24,5
	brne L67
X11:
	.dbline 378
	.dbline 379
; 		reset_6B();
	xcall _reset_6B
	.dbline 380
; 	}
L67:
	.dbline -2
L56:
	.dbline 0 ; func end
	ld R0,y+
	out 0x3f,R0
	ld R31,y+
	ld R30,y+
	ld R27,y+
	ld R26,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R9,y+
	ld R8,y+
	ld R7,y+
	ld R6,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	ld R1,y+
	ld R0,y+
	reti
	.dbend
	.area vector(rom, abs)
	.org 76
	jmp _timer1_compc_isr
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbfunc e timer1_compc_isr _timer1_compc_isr fV
	.even
_timer1_compc_isr::
	st -y,R0
	st -y,R1
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R6
	st -y,R7
	st -y,R8
	st -y,R9
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R26
	st -y,R27
	st -y,R30
	st -y,R31
	in R0,0x3f
	st -y,R0
	.dbline -1
	.dbline 384
; }
; 
; #pragma interrupt_handler timer1_compc_isr:iv_TIM1_COMPC
; void timer1_compc_isr(void) {
	.dbline 386
; 	//compare occured TCNT1=OCR1c
; 	if (arm_number == 0) {
	lds R2,_arm_number
	tst R2
	brne L70
X12:
	.dbline 386
	.dbline 387
; 		reset_1C();
	xcall _reset_1C
	.dbline 388
; 	}
L70:
	.dbline 389
; 	if (arm_number == 1) {
	lds R24,_arm_number
	cpi R24,1
	brne L72
X13:
	.dbline 389
	.dbline 390
; 		reset_2C();
	xcall _reset_2C
	.dbline 391
; 	}
L72:
	.dbline 392
; 	if (arm_number == 2) {
	lds R24,_arm_number
	cpi R24,2
	brne L74
X14:
	.dbline 392
	.dbline 393
; 		reset_3C();
	xcall _reset_3C
	.dbline 394
; 	}
L74:
	.dbline 395
; 	if (arm_number == 3) {
	lds R24,_arm_number
	cpi R24,3
	brne L76
X15:
	.dbline 395
	.dbline 396
; 		reset_4C();
	xcall _reset_4C
	.dbline 397
; 	}
L76:
	.dbline 398
; 	if (arm_number == 4) {
	lds R24,_arm_number
	cpi R24,4
	brne L78
X16:
	.dbline 398
	.dbline 399
; 		reset_5C();
	xcall _reset_5C
	.dbline 400
; 	}
L78:
	.dbline 401
; 	if (arm_number == 5) {
	lds R24,_arm_number
	cpi R24,5
	brne L80
X17:
	.dbline 401
	.dbline 402
; 		reset_6C();
	xcall _reset_6C
	.dbline 403
; 	}
L80:
	.dbline -2
L69:
	.dbline 0 ; func end
	ld R0,y+
	out 0x3f,R0
	ld R31,y+
	ld R30,y+
	ld R27,y+
	ld R26,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R9,y+
	ld R8,y+
	ld R7,y+
	ld R6,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	ld R1,y+
	ld R0,y+
	reti
	.dbend
	.area vector(rom, abs)
	.org 80
	jmp _timer1_ovf_isr
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbfunc e timer1_ovf_isr _timer1_ovf_isr fV
	.even
_timer1_ovf_isr::
	st -y,R0
	st -y,R1
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R6
	st -y,R7
	st -y,R8
	st -y,R9
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R26
	st -y,R27
	st -y,R30
	st -y,R31
	in R0,0x3f
	st -y,R0
	.dbline -1
	.dbline 407
; }
; 
; #pragma interrupt_handler timer1_ovf_isr:iv_TIM1_OVF
; void timer1_ovf_isr(void) {
	.dbline 409
; 	//TIMER1 has overflowed
; 	TCNT1H = 0x94; //reload counter high value
	ldi R24,148
	sts 133,R24
	.dbline 410
; 	TCNT1L = 0x01; //reload counter low value
	ldi R24,1
	sts 132,R24
	.dbline 411
; 	delay_count++;
	lds R24,_delay_count
	lds R25,_delay_count+1
	adiw R24,1
	sts _delay_count+1,R25
	sts _delay_count,R24
	.dbline 412
; 	arm_number++;
	lds R24,_arm_number
	subi R24,255    ; addi 1
	sts _arm_number,R24
	.dbline 413
; 	if (arm_number > 7) {
	ldi R24,7
	lds R2,_arm_number
	cp R24,R2
	brsh L83
X18:
	.dbline 413
	.dbline 414
; 		arm_number = 0;
	clr R2
	sts _arm_number,R2
	.dbline 415
; 	}
L83:
	.dbline 417
; 
; 	if (arm_number == 0) {
	lds R2,_arm_number
	tst R2
	brne L85
X19:
	.dbline 417
	.dbline 418
; 		set_1A();
	xcall _set_1A
	.dbline 419
; 		set_1B();
	xcall _set_1B
	.dbline 420
; 		set_1C();
	xcall _set_1C
	.dbline 421
; 		OCR1AH = angle_upper_byte_1A;
	lds R2,_angle_upper_byte_1A
	sts 137,R2
	.dbline 422
; 		OCR1AL = angle_lower_byte_1A;
	lds R2,_angle_lower_byte_1A
	sts 136,R2
	.dbline 423
; 		OCR1BH = angle_upper_byte_1B;
	lds R2,_angle_upper_byte_1B
	lds R3,_angle_upper_byte_1B+1
	sts 139,R2
	.dbline 424
; 		OCR1BL = angle_lower_byte_1B;
	lds R2,_angle_lower_byte_1B
	lds R3,_angle_lower_byte_1B+1
	sts 138,R2
	.dbline 425
; 		OCR1CH = angle_upper_byte_1C;
	lds R2,_angle_upper_byte_1C
	lds R3,_angle_upper_byte_1C+1
	sts 141,R2
	.dbline 426
; 		OCR1CL = angle_lower_byte_1C;
	lds R2,_angle_lower_byte_1C
	lds R3,_angle_lower_byte_1C+1
	sts 140,R2
	.dbline 427
; 	}
L85:
	.dbline 429
; 
; 	if (arm_number == 1) {
	lds R24,_arm_number
	cpi R24,1
	brne L87
X20:
	.dbline 429
	.dbline 430
; 		set_2A();
	xcall _set_2A
	.dbline 431
; 		set_2B();
	xcall _set_2B
	.dbline 432
; 		set_2C();
	xcall _set_2C
	.dbline 433
; 		OCR1AH = angle_upper_byte_2A;
	lds R2,_angle_upper_byte_2A
	sts 137,R2
	.dbline 434
; 		OCR1AL = angle_lower_byte_2A;
	lds R2,_angle_lower_byte_2A
	sts 136,R2
	.dbline 435
; 		OCR1BH = angle_upper_byte_2B;
	lds R2,_angle_upper_byte_2B
	lds R3,_angle_upper_byte_2B+1
	sts 139,R2
	.dbline 436
; 		OCR1BL = angle_lower_byte_2B;
	lds R2,_angle_lower_byte_2B
	lds R3,_angle_lower_byte_2B+1
	sts 138,R2
	.dbline 437
; 		OCR1CH = angle_upper_byte_2C;
	lds R2,_angle_upper_byte_2C
	lds R3,_angle_upper_byte_2C+1
	sts 141,R2
	.dbline 438
; 		OCR1CL = angle_lower_byte_2C;
	lds R2,_angle_lower_byte_2C
	lds R3,_angle_lower_byte_2C+1
	sts 140,R2
	.dbline 439
; 	}
L87:
	.dbline 441
; 
; 	if (arm_number == 2) {
	lds R24,_arm_number
	cpi R24,2
	brne L89
X21:
	.dbline 441
	.dbline 442
; 		set_3A();
	xcall _set_3A
	.dbline 443
; 		set_3B();
	xcall _set_3B
	.dbline 444
; 		set_3C();
	xcall _set_3C
	.dbline 445
; 		OCR1AH = angle_upper_byte_3A;
	lds R2,_angle_upper_byte_3A
	sts 137,R2
	.dbline 446
; 		OCR1AL = angle_lower_byte_3A;
	lds R2,_angle_lower_byte_3A
	sts 136,R2
	.dbline 447
; 		OCR1BH = angle_upper_byte_3B;
	lds R2,_angle_upper_byte_3B
	lds R3,_angle_upper_byte_3B+1
	sts 139,R2
	.dbline 448
; 		OCR1BL = angle_lower_byte_3B;
	lds R2,_angle_lower_byte_3B
	lds R3,_angle_lower_byte_3B+1
	sts 138,R2
	.dbline 449
; 		OCR1CH = angle_upper_byte_3C;
	lds R2,_angle_upper_byte_3C
	lds R3,_angle_upper_byte_3C+1
	sts 141,R2
	.dbline 450
; 		OCR1CL = angle_lower_byte_3C;
	lds R2,_angle_lower_byte_3C
	lds R3,_angle_lower_byte_3C+1
	sts 140,R2
	.dbline 451
; 	}
L89:
	.dbline 453
; 
; 	if (arm_number == 3) {
	lds R24,_arm_number
	cpi R24,3
	brne L91
X22:
	.dbline 453
	.dbline 454
; 		set_4A();
	xcall _set_4A
	.dbline 455
; 		set_4B();
	xcall _set_4B
	.dbline 456
; 		set_4C();
	xcall _set_4C
	.dbline 457
; 		OCR1AH = angle_upper_byte_4A;
	lds R2,_angle_upper_byte_4A
	sts 137,R2
	.dbline 458
; 		OCR1AL = angle_lower_byte_4A;
	lds R2,_angle_lower_byte_4A
	sts 136,R2
	.dbline 459
; 		OCR1BH = angle_upper_byte_4B;
	lds R2,_angle_upper_byte_4B
	lds R3,_angle_upper_byte_4B+1
	sts 139,R2
	.dbline 460
; 		OCR1BL = angle_lower_byte_4B;
	lds R2,_angle_lower_byte_4B
	lds R3,_angle_lower_byte_4B+1
	sts 138,R2
	.dbline 461
; 		OCR1CH = angle_upper_byte_4C;
	lds R2,_angle_upper_byte_4C
	lds R3,_angle_upper_byte_4C+1
	sts 141,R2
	.dbline 462
; 		OCR1CL = angle_lower_byte_4C;
	lds R2,_angle_lower_byte_4C
	lds R3,_angle_lower_byte_4C+1
	sts 140,R2
	.dbline 463
; 	}
L91:
	.dbline 465
; 
; 	if (arm_number == 4) {
	lds R24,_arm_number
	cpi R24,4
	brne L93
X23:
	.dbline 465
	.dbline 466
; 		set_5A();
	xcall _set_5A
	.dbline 467
; 		set_5B();
	xcall _set_5B
	.dbline 468
; 		set_5C();
	xcall _set_5C
	.dbline 469
; 		OCR1AH = angle_upper_byte_5A;
	lds R2,_angle_upper_byte_5A
	sts 137,R2
	.dbline 470
; 		OCR1AL = angle_lower_byte_5A;
	lds R2,_angle_lower_byte_5A
	sts 136,R2
	.dbline 471
; 		OCR1BH = angle_upper_byte_5B;
	lds R2,_angle_upper_byte_5B
	lds R3,_angle_upper_byte_5B+1
	sts 139,R2
	.dbline 472
; 		OCR1BL = angle_lower_byte_5B;
	lds R2,_angle_lower_byte_5B
	lds R3,_angle_lower_byte_5B+1
	sts 138,R2
	.dbline 473
; 		OCR1CH = angle_upper_byte_5C;
	lds R2,_angle_upper_byte_5C
	lds R3,_angle_upper_byte_5C+1
	sts 141,R2
	.dbline 474
; 		OCR1CL = angle_lower_byte_5C;
	lds R2,_angle_lower_byte_5C
	lds R3,_angle_lower_byte_5C+1
	sts 140,R2
	.dbline 475
; 	}
L93:
	.dbline 477
; 
; 	if (arm_number == 5) {
	lds R24,_arm_number
	cpi R24,5
	brne L95
X24:
	.dbline 477
	.dbline 478
; 		set_6A();
	xcall _set_6A
	.dbline 479
; 		set_6B();
	xcall _set_6B
	.dbline 480
; 		set_6C();
	xcall _set_6C
	.dbline 481
; 		OCR1AH = angle_upper_byte_6A;
	lds R2,_angle_upper_byte_6A
	sts 137,R2
	.dbline 482
; 		OCR1AL = angle_lower_byte_6A;
	lds R2,_angle_lower_byte_6A
	sts 136,R2
	.dbline 483
; 		OCR1BH = angle_upper_byte_6B;
	lds R2,_angle_upper_byte_6B
	lds R3,_angle_upper_byte_6B+1
	sts 139,R2
	.dbline 484
; 		OCR1BL = angle_lower_byte_6B;
	lds R2,_angle_lower_byte_6B
	lds R3,_angle_lower_byte_6B+1
	sts 138,R2
	.dbline 485
; 		OCR1CH = angle_upper_byte_6C;
	lds R2,_angle_upper_byte_6C
	lds R3,_angle_upper_byte_6C+1
	sts 141,R2
	.dbline 486
; 		OCR1CL = angle_lower_byte_6C;
	lds R2,_angle_lower_byte_6C
	lds R3,_angle_lower_byte_6C+1
	sts 140,R2
	.dbline 487
; 	}
L95:
	.dbline -2
L82:
	.dbline 0 ; func end
	ld R0,y+
	out 0x3f,R0
	ld R31,y+
	ld R30,y+
	ld R27,y+
	ld R26,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R9,y+
	ld R8,y+
	ld R7,y+
	ld R6,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	ld R1,y+
	ld R0,y+
	reti
	.dbend
	.dbfunc e uart0_init _uart0_init fV
	.even
_uart0_init::
	.dbline -1
	.dbline 511
; 	//serial communication related code
; 	/*serial_communication_interval++;
; 	if (serial_communication_interval > 40) //gives time interval of 40*2.5ms = 100ms
; 	{
; 		serial_communication_interval = 0;
; 		serial_communication_channel_number++;
; 		if (serial_communication_channel_number > 4) //set maximum number of command (can be set up to 7)
; 		{
; 			serial_communication_channel_number = 3; //set first command to begin with (can be set up to 1)
; 		}
; 		UDR0 = serial_communication_channel_number;
; 	}*/
; }
; 
; 
; 
; 
; 
; //UART0 initialize
; // desired baud rate: 9600
; // actual: baud rate:9600 (0.0%)
; // char size: 8 bit
; // parity: Disabled
; void uart0_init(void) {
	.dbline 512
; 	UCSR0B = 0x00; //disable while setting baud rate
	clr R2
	sts 193,R2
	.dbline 513
; 	UCSR0A = 0x00;
	sts 192,R2
	.dbline 514
; 	UCSR0C = 0x06;
	ldi R24,6
	sts 194,R24
	.dbline 515
; 	UBRR0L = 0x47; //set baud rate lo
	ldi R24,71
	sts 196,R24
	.dbline 516
; 	UBRR0H = 0x00; //set baud rate hi
	sts 197,R2
	.dbline 517
; 	UCSR0B = 0x98;
	ldi R24,152
	sts 193,R24
	.dbline -2
L97:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e init_devices _init_devices fV
	.even
_init_devices::
	.dbline -1
	.dbline 523
; }
; 
; 
; 
; //call this routine to initialize all peripherals
; void init_devices(void) {
	.dbline 525
; 	//stop errant interrupts until set up
; 	CLI(); //disable all interrupts
	cli
	.dbline 526
; 	XMCRA = 0x00; //external memory
	clr R2
	sts 116,R2
	.dbline 527
; 	XMCRB = 0x00; //external memory
	sts 117,R2
	.dbline 528
; 	port_init();
	xcall _port_init
	.dbline 529
; 	timer1_init();
	xcall _timer1_init
	.dbline 530
; 	uart0_init();
	xcall _uart0_init
	.dbline 532
; 
; 	MCUCR = 0x00;
	clr R2
	out 0x35,R2
	.dbline 533
; 	EICRA = 0x00; //pin change int edge 0:3
	sts 105,R2
	.dbline 534
; 	EICRB = 0x00; //pin change int edge 4:7
	sts 106,R2
	.dbline 535
; 	PCICR = 0x00; //pin change int enable
	sts 104,R2
	.dbline 536
; 	PCMSK0 = 0x00; //pin change mask
	sts 107,R2
	.dbline 537
; 	PCMSK1 = 0x00; //pin change mask
	sts 108,R2
	.dbline 538
; 	PCMSK2 = 0x00; //pin change mask
	sts 109,R2
	.dbline 539
; 	EIMSK = 0x00;
	out 0x1d,R2
	.dbline 540
; 	TIMSK0 = 0x00; //timer0 interrupt sources
	sts 110,R2
	.dbline 541
; 	TIMSK1 = 0x0F; //timer1 interrupt sources
	ldi R24,15
	sts 111,R24
	.dbline 542
; 	TIMSK2 = 0x00; //timer2 interrupt sources
	sts 112,R2
	.dbline 543
; 	TIMSK3 = 0x00; //timer3 interrupt sources
	sts 113,R2
	.dbline 544
; 	TIMSK4 = 0x00; //timer4 interrupt sources
	sts 114,R2
	.dbline 545
; 	TIMSK5 = 0x00; //timer5 interrupt sources
	sts 115,R2
	.dbline 547
; 
; 	SEI(); //re-enable interrupts
	sei
	.dbline -2
L98:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 100
	jmp _uart0_rx_isr
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
	.dbfunc e uart0_rx_isr _uart0_rx_isr fV
	.even
_uart0_rx_isr::
	st -y,R0
	st -y,R1
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R6
	st -y,R7
	st -y,R8
	st -y,R9
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R26
	st -y,R27
	st -y,R30
	st -y,R31
	in R0,0x3f
	st -y,R0
	.dbline -1
	.dbline 552
; 	//all peripherals are now initialized
; }
; 
; #pragma interrupt_handler uart0_rx_isr:iv_USART0_RXC
; void uart0_rx_isr(void) {
	.dbline 557
; 	//uart has received a character in UDR
; 	
; 	//buzzer_on();
; 	
; 	data = UDR0;
	lds R2,198
	sts _data,R2
	.dbline 558
; 	UDR0 = data;
	sts 198,R2
	.dbline 559
; 	if(KEYBOARD_ON)
	.dbline 560
; 	    keyboard_control();
	xcall _keyboard_control
L100:
	.dbline -2
L99:
	.dbline 0 ; func end
	ld R0,y+
	out 0x3f,R0
	ld R31,y+
	ld R30,y+
	ld R27,y+
	ld R26,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R9,y+
	ld R8,y+
	ld R7,y+
	ld R6,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	ld R1,y+
	ld R0,y+
	reti
	.dbend
	.dbfunc e servo_on _servo_on fV
	.even
_servo_on::
	.dbline -1
	.dbline 563
; }
; 
; void servo_on(void) {
	.dbline 564
; 	PORTB = PORTB | 0x01;
	sbi 0x5,0
	.dbline -2
L102:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e servo_off _servo_off fV
	.even
_servo_off::
	.dbline -1
	.dbline 567
; }
; 
; void servo_off(void) {
	.dbline 568
; 	PORTB = PORTB & 0xFE;
	in R24,0x5
	andi R24,254
	out 0x5,R24
	.dbline -2
L103:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e reset_SP_LEFT _reset_SP_LEFT fV
	.even
_reset_SP_LEFT::
	.dbline -1
	.dbline 571
; }
; 
; void reset_SP_LEFT(void) {
	.dbline 572
; 	PORTL = PORTL & 0xFD;
	lds R24,267
	andi R24,253
	sts 267,R24
	.dbline -2
L104:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e set_SP_LEFT _set_SP_LEFT fV
	.even
_set_SP_LEFT::
	.dbline -1
	.dbline 575
; }
; 
; void set_SP_LEFT(void) {
	.dbline 576
; 	PORTL = PORTL | 0x02;
	lds R24,267
	ori R24,2
	sts 267,R24
	.dbline -2
L105:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e angle_value_calculation _angle_value_calculation fV
;           temp -> R16,R17
;    angle_value -> R18,R19
	.even
_angle_value_calculation::
	.dbline -1
	.dbline 580
; }
; 
; 
; void angle_value_calculation(void) {
	.dbline 581
; 	unsigned int angle_value = 0;
	clr R18
	clr R19
	.dbline 582
; 	unsigned int temp = 0;
	clr R16
	clr R17
	.dbline 583
; 	if (degree > 180)
	ldi R24,180
	lds R2,_degree
	cp R24,R2
	brsh L107
X25:
	.dbline 584
; 		degree = 180; // limiting the scope of the servo rotation
	sts _degree,R24
L107:
	.dbline 586
; 
; 	angle_value = 0xBF39 + (64 * (unsigned char) degree); //actual constant is 64.4
	lds R2,_degree
	ldi R24,64
	mul R24,R2
	movw R18,R0
	subi R18,199  ; offset = 48953
	sbci R19,64
	.dbline 588
; 
; 	angle_lower_byte = (unsigned char) angle_value; //separating the lower byte
	sts _angle_lower_byte,R18
	.dbline 590
; 
; 	temp = angle_value >> 8;
	movw R16,R18
	mov R16,R17
	clr R17
	.dbline 591
; 	angle_upper_byte = (unsigned char) temp; //separating the upper byte
	sts _angle_upper_byte,R16
	.dbline -2
L106:
	.dbline 0 ; func end
	ret
	.dbsym r temp 16 i
	.dbsym r angle_value 18 i
	.dbend
	.dbfunc e angle_1A _angle_1A fV
;          angle -> R10
	.even
_angle_1A::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 594
; }
; 
; void angle_1A(unsigned char angle) {
	.dbline 595
; 	degree = angle;
	sts _degree,R10
	.dbline 596
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 597
; 	angle_upper_byte_1A = angle_upper_byte;
	lds R2,_angle_upper_byte
	sts _angle_upper_byte_1A,R2
	.dbline 598
; 	angle_lower_byte_1A = angle_lower_byte;
	lds R2,_angle_lower_byte
	sts _angle_lower_byte_1A,R2
	.dbline -2
L109:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_1B _angle_1B fV
;          angle -> R10
	.even
_angle_1B::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 601
; }
; 
; void angle_1B(unsigned char angle) {
	.dbline 602
; 	degree = angle;
	sts _degree,R10
	.dbline 603
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 604
; 	angle_upper_byte_1B = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_1B+1,R3
	sts _angle_upper_byte_1B,R2
	.dbline 605
; 	angle_lower_byte_1B = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_1B+1,R3
	sts _angle_lower_byte_1B,R2
	.dbline -2
L110:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_1C _angle_1C fV
;          angle -> R10
	.even
_angle_1C::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 608
; }
; 
; void angle_1C(unsigned char angle) {
	.dbline 609
; 	degree = angle;
	sts _degree,R10
	.dbline 610
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 611
; 	angle_upper_byte_1C = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_1C+1,R3
	sts _angle_upper_byte_1C,R2
	.dbline 612
; 	angle_lower_byte_1C = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_1C+1,R3
	sts _angle_lower_byte_1C,R2
	.dbline -2
L111:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_2A _angle_2A fV
;          angle -> R10
	.even
_angle_2A::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 615
; }
; 
; void angle_2A(unsigned char angle) {
	.dbline 616
; 	degree = angle;
	sts _degree,R10
	.dbline 617
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 618
; 	angle_upper_byte_2A = angle_upper_byte;
	lds R2,_angle_upper_byte
	sts _angle_upper_byte_2A,R2
	.dbline 619
; 	angle_lower_byte_2A = angle_lower_byte;
	lds R2,_angle_lower_byte
	sts _angle_lower_byte_2A,R2
	.dbline -2
L112:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_2B _angle_2B fV
;          angle -> R10
	.even
_angle_2B::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 622
; }
; 
; void angle_2B(unsigned char angle) {
	.dbline 623
; 	degree = angle;
	sts _degree,R10
	.dbline 624
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 625
; 	angle_upper_byte_2B = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_2B+1,R3
	sts _angle_upper_byte_2B,R2
	.dbline 626
; 	angle_lower_byte_2B = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_2B+1,R3
	sts _angle_lower_byte_2B,R2
	.dbline -2
L113:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_2C _angle_2C fV
;          angle -> R10
	.even
_angle_2C::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 629
; }
; 
; void angle_2C(unsigned char angle) {
	.dbline 630
; 	degree = angle;
	sts _degree,R10
	.dbline 631
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 632
; 	angle_upper_byte_2C = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_2C+1,R3
	sts _angle_upper_byte_2C,R2
	.dbline 633
; 	angle_lower_byte_2C = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_2C+1,R3
	sts _angle_lower_byte_2C,R2
	.dbline -2
L114:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_3A _angle_3A fV
;          angle -> R10
	.even
_angle_3A::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 636
; }
; 
; void angle_3A(unsigned char angle) {
	.dbline 637
; 	degree = angle;
	sts _degree,R10
	.dbline 638
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 639
; 	angle_upper_byte_3A = angle_upper_byte;
	lds R2,_angle_upper_byte
	sts _angle_upper_byte_3A,R2
	.dbline 640
; 	angle_lower_byte_3A = angle_lower_byte;
	lds R2,_angle_lower_byte
	sts _angle_lower_byte_3A,R2
	.dbline -2
L115:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_3B _angle_3B fV
;          angle -> R10
	.even
_angle_3B::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 643
; }
; 
; void angle_3B(unsigned char angle) {
	.dbline 644
; 	degree = angle;
	sts _degree,R10
	.dbline 645
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 646
; 	angle_upper_byte_3B = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_3B+1,R3
	sts _angle_upper_byte_3B,R2
	.dbline 647
; 	angle_lower_byte_3B = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_3B+1,R3
	sts _angle_lower_byte_3B,R2
	.dbline -2
L116:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_3C _angle_3C fV
;          angle -> R10
	.even
_angle_3C::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 650
; }
; 
; void angle_3C(unsigned char angle) {
	.dbline 651
; 	degree = angle;
	sts _degree,R10
	.dbline 652
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 653
; 	angle_upper_byte_3C = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_3C+1,R3
	sts _angle_upper_byte_3C,R2
	.dbline 654
; 	angle_lower_byte_3C = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_3C+1,R3
	sts _angle_lower_byte_3C,R2
	.dbline -2
L117:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_4A _angle_4A fV
;          angle -> R10
	.even
_angle_4A::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 657
; }
; 
; void angle_4A(unsigned char angle) {
	.dbline 658
; 	degree = angle;
	sts _degree,R10
	.dbline 659
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 660
; 	angle_upper_byte_4A = angle_upper_byte;
	lds R2,_angle_upper_byte
	sts _angle_upper_byte_4A,R2
	.dbline 661
; 	angle_lower_byte_4A = angle_lower_byte;
	lds R2,_angle_lower_byte
	sts _angle_lower_byte_4A,R2
	.dbline -2
L118:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_4B _angle_4B fV
;          angle -> R10
	.even
_angle_4B::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 664
; }
; 
; void angle_4B(unsigned char angle) {
	.dbline 665
; 	degree = angle;
	sts _degree,R10
	.dbline 666
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 667
; 	angle_upper_byte_4B = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_4B+1,R3
	sts _angle_upper_byte_4B,R2
	.dbline 668
; 	angle_lower_byte_4B = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_4B+1,R3
	sts _angle_lower_byte_4B,R2
	.dbline -2
L119:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_4C _angle_4C fV
;          angle -> R10
	.even
_angle_4C::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 671
; }
; 
; void angle_4C(unsigned char angle) {
	.dbline 672
; 	degree = angle;
	sts _degree,R10
	.dbline 673
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 674
; 	angle_upper_byte_4C = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_4C+1,R3
	sts _angle_upper_byte_4C,R2
	.dbline 675
; 	angle_lower_byte_4C = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_4C+1,R3
	sts _angle_lower_byte_4C,R2
	.dbline -2
L120:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_5A _angle_5A fV
;          angle -> R10
	.even
_angle_5A::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 678
; }
; 
; void angle_5A(unsigned char angle) {
	.dbline 679
; 	degree = angle;
	sts _degree,R10
	.dbline 680
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 681
; 	angle_upper_byte_5A = angle_upper_byte;
	lds R2,_angle_upper_byte
	sts _angle_upper_byte_5A,R2
	.dbline 682
; 	angle_lower_byte_5A = angle_lower_byte;
	lds R2,_angle_lower_byte
	sts _angle_lower_byte_5A,R2
	.dbline -2
L121:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_5B _angle_5B fV
;          angle -> R10
	.even
_angle_5B::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 685
; }
; 
; void angle_5B(unsigned char angle) {
	.dbline 686
; 	degree = angle;
	sts _degree,R10
	.dbline 687
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 688
; 	angle_upper_byte_5B = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_5B+1,R3
	sts _angle_upper_byte_5B,R2
	.dbline 689
; 	angle_lower_byte_5B = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_5B+1,R3
	sts _angle_lower_byte_5B,R2
	.dbline -2
L122:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_5C _angle_5C fV
;          angle -> R10
	.even
_angle_5C::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 692
; }
; 
; void angle_5C(unsigned char angle) {
	.dbline 693
; 	degree = angle;
	sts _degree,R10
	.dbline 694
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 695
; 	angle_upper_byte_5C = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_5C+1,R3
	sts _angle_upper_byte_5C,R2
	.dbline 696
; 	angle_lower_byte_5C = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_5C+1,R3
	sts _angle_lower_byte_5C,R2
	.dbline -2
L123:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_6A _angle_6A fV
;          angle -> R10
	.even
_angle_6A::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 699
; }
; 
; void angle_6A(unsigned char angle) {
	.dbline 700
; 	degree = angle;
	sts _degree,R10
	.dbline 701
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 702
; 	angle_upper_byte_6A = angle_upper_byte;
	lds R2,_angle_upper_byte
	sts _angle_upper_byte_6A,R2
	.dbline 703
; 	angle_lower_byte_6A = angle_lower_byte;
	lds R2,_angle_lower_byte
	sts _angle_lower_byte_6A,R2
	.dbline -2
L124:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_6B _angle_6B fV
;          angle -> R10
	.even
_angle_6B::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 706
; }
; 
; void angle_6B(unsigned char angle) {
	.dbline 707
; 	degree = angle;
	sts _degree,R10
	.dbline 708
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 709
; 	angle_upper_byte_6B = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_6B+1,R3
	sts _angle_upper_byte_6B,R2
	.dbline 710
; 	angle_lower_byte_6B = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_6B+1,R3
	sts _angle_lower_byte_6B,R2
	.dbline -2
L125:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e angle_6C _angle_6C fV
;          angle -> R10
	.even
_angle_6C::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 713
; }
; 
; void angle_6C(unsigned char angle) {
	.dbline 714
; 	degree = angle;
	sts _degree,R10
	.dbline 715
; 	angle_value_calculation();
	xcall _angle_value_calculation
	.dbline 716
; 	angle_upper_byte_6C = angle_upper_byte;
	lds R2,_angle_upper_byte
	clr R3
	sts _angle_upper_byte_6C+1,R3
	sts _angle_upper_byte_6C,R2
	.dbline 717
; 	angle_lower_byte_6C = angle_lower_byte;
	lds R2,_angle_lower_byte
	clr R3
	sts _angle_lower_byte_6C+1,R3
	sts _angle_lower_byte_6C,R2
	.dbline -2
L126:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r angle 10 c
	.dbend
	.dbfunc e servo_calibration _servo_calibration fV
	.even
_servo_calibration::
	.dbline -1
	.dbline 722
; }
; 
; 
; 
; void servo_calibration(void) {
	.dbline 723
; 	angle_1A(90);
	ldi R16,90
	xcall _angle_1A
	.dbline 724
; 	angle_1B(90);
	ldi R16,90
	xcall _angle_1B
	.dbline 725
; 	angle_1C(90);
	ldi R16,90
	xcall _angle_1C
	.dbline 726
; 	angle_2A(90);
	ldi R16,90
	xcall _angle_2A
	.dbline 727
; 	angle_2B(90);
	ldi R16,90
	xcall _angle_2B
	.dbline 728
; 	angle_2C(90);
	ldi R16,90
	xcall _angle_2C
	.dbline 729
; 	angle_3A(90);
	ldi R16,90
	xcall _angle_3A
	.dbline 730
; 	angle_3B(90);
	ldi R16,90
	xcall _angle_3B
	.dbline 731
; 	angle_3C(90);
	ldi R16,90
	xcall _angle_3C
	.dbline 732
; 	angle_4A(90);
	ldi R16,90
	xcall _angle_4A
	.dbline 733
; 	angle_4B(90);
	ldi R16,90
	xcall _angle_4B
	.dbline 734
; 	angle_4C(90);
	ldi R16,90
	xcall _angle_4C
	.dbline 735
; 	angle_5A(90);
	ldi R16,90
	xcall _angle_5A
	.dbline 736
; 	angle_5B(90);
	ldi R16,90
	xcall _angle_5B
	.dbline 737
; 	angle_5C(90);
	ldi R16,90
	xcall _angle_5C
	.dbline 738
; 	angle_6A(90);
	ldi R16,90
	xcall _angle_6A
	.dbline 739
; 	angle_6B(90);
	ldi R16,90
	xcall _angle_6B
	.dbline 740
; 	angle_6C(90);
	ldi R16,90
	xcall _angle_6C
	.dbline -2
L127:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e even_A_servo_90 _even_A_servo_90 fV
	.even
_even_A_servo_90::
	.dbline -1
	.dbline 743
; }
; 
; void even_A_servo_90(void) {
	.dbline 744
; 	angle_2A(90);
	ldi R16,90
	xcall _angle_2A
	.dbline 745
; 	angle_4A(90);
	ldi R16,90
	xcall _angle_4A
	.dbline 746
; 	angle_6A(90);
	ldi R16,90
	xcall _angle_6A
	.dbline -2
L128:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e even_A_servo_65 _even_A_servo_65 fV
	.even
_even_A_servo_65::
	.dbline -1
	.dbline 750
; }
; 
; void even_A_servo_65(void) //clockwise
; {
	.dbline 751
; 	angle_2A(65);
	ldi R16,65
	xcall _angle_2A
	.dbline 752
; 	angle_4A(65);
	ldi R16,65
	xcall _angle_4A
	.dbline 753
; 	angle_6A(65);
	ldi R16,65
	xcall _angle_6A
	.dbline -2
L129:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e even_A_servo_115 _even_A_servo_115 fV
	.even
_even_A_servo_115::
	.dbline -1
	.dbline 757
; }
; 
; void even_A_servo_115(void)//anticlockwise_
; {
	.dbline 758
; 	angle_2A(115);
	ldi R16,115
	xcall _angle_2A
	.dbline 759
; 	angle_4A(115);
	ldi R16,115
	xcall _angle_4A
	.dbline 760
; 	angle_6A(115);
	ldi R16,115
	xcall _angle_6A
	.dbline -2
L130:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e even_BC_servo_90 _even_BC_servo_90 fV
	.even
_even_BC_servo_90::
	.dbline -1
	.dbline 763
; }
; 
; void even_BC_servo_90(void) {
	.dbline 764
; 	angle_2B(90);
	ldi R16,90
	xcall _angle_2B
	.dbline 765
; 	angle_2C(90);
	ldi R16,90
	xcall _angle_2C
	.dbline 766
; 	angle_4B(90);
	ldi R16,90
	xcall _angle_4B
	.dbline 767
; 	angle_4C(90);
	ldi R16,90
	xcall _angle_4C
	.dbline 768
; 	angle_6B(90);
	ldi R16,90
	xcall _angle_6B
	.dbline 769
; 	angle_6C(90);
	ldi R16,90
	xcall _angle_6C
	.dbline -2
L131:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e even_BC_servo_up_45 _even_BC_servo_up_45 fV
	.even
_even_BC_servo_up_45::
	.dbline -1
	.dbline 772
; }
; 
; void even_BC_servo_up_45(void) {
	.dbline 773
; 	angle_2B(45);
	ldi R16,45
	xcall _angle_2B
	.dbline 774
; 	angle_2C(90);
	ldi R16,90
	xcall _angle_2C
	.dbline 775
; 	angle_4B(135);
	ldi R16,135
	xcall _angle_4B
	.dbline 776
; 	angle_4C(90);
	ldi R16,90
	xcall _angle_4C
	.dbline 777
; 	angle_6B(135);
	ldi R16,135
	xcall _angle_6B
	.dbline 778
; 	angle_6C(90);
	ldi R16,90
	xcall _angle_6C
	.dbline -2
L132:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e even_BC_servo_down_45 _even_BC_servo_down_45 fV
	.even
_even_BC_servo_down_45::
	.dbline -1
	.dbline 781
; }
; 
; void even_BC_servo_down_45(void) {
	.dbline 782
; 	angle_2B(135);
	ldi R16,135
	xcall _angle_2B
	.dbline 783
; 	angle_2C(135);
	ldi R16,135
	xcall _angle_2C
	.dbline 784
; 	angle_4B(45);
	ldi R16,45
	xcall _angle_4B
	.dbline 785
; 	angle_4C(45);
	ldi R16,45
	xcall _angle_4C
	.dbline 786
; 	angle_6B(45);
	ldi R16,45
	xcall _angle_6B
	.dbline 787
; 	angle_6C(45);
	ldi R16,45
	xcall _angle_6C
	.dbline -2
L133:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e odd_A_servo_90 _odd_A_servo_90 fV
	.even
_odd_A_servo_90::
	.dbline -1
	.dbline 790
; }
; 
; void odd_A_servo_90(void) {
	.dbline 791
; 	angle_1A(90);
	ldi R16,90
	xcall _angle_1A
	.dbline 792
; 	angle_3A(90);
	ldi R16,90
	xcall _angle_3A
	.dbline 793
; 	angle_5A(90);
	ldi R16,90
	xcall _angle_5A
	.dbline -2
L134:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e odd_A_servo_65 _odd_A_servo_65 fV
	.even
_odd_A_servo_65::
	.dbline -1
	.dbline 797
; }
; 
; void odd_A_servo_65(void)//clockwise
; {
	.dbline 798
; 	angle_1A(65);
	ldi R16,65
	xcall _angle_1A
	.dbline 799
; 	angle_3A(65);
	ldi R16,65
	xcall _angle_3A
	.dbline 800
; 	angle_5A(65);
	ldi R16,65
	xcall _angle_5A
	.dbline -2
L135:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e odd_A_servo_115 _odd_A_servo_115 fV
	.even
_odd_A_servo_115::
	.dbline -1
	.dbline 804
; }
; 
; void odd_A_servo_115(void) //anticlockwise
; {
	.dbline 805
; 	angle_1A(115);
	ldi R16,115
	xcall _angle_1A
	.dbline 806
; 	angle_3A(115);
	ldi R16,115
	xcall _angle_3A
	.dbline 807
; 	angle_5A(115);
	ldi R16,115
	xcall _angle_5A
	.dbline -2
L136:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e odd_BC_servo_90 _odd_BC_servo_90 fV
	.even
_odd_BC_servo_90::
	.dbline -1
	.dbline 810
; }
; 
; void odd_BC_servo_90(void) {
	.dbline 811
; 	angle_1B(90);
	ldi R16,90
	xcall _angle_1B
	.dbline 812
; 	angle_1C(90);
	ldi R16,90
	xcall _angle_1C
	.dbline 813
; 	angle_3B(90);
	ldi R16,90
	xcall _angle_3B
	.dbline 814
; 	angle_3C(90);
	ldi R16,90
	xcall _angle_3C
	.dbline 815
; 	angle_5B(90);
	ldi R16,90
	xcall _angle_5B
	.dbline 816
; 	angle_5C(90);
	ldi R16,90
	xcall _angle_5C
	.dbline -2
L137:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e odd_BC_servo_up_45 _odd_BC_servo_up_45 fV
	.even
_odd_BC_servo_up_45::
	.dbline -1
	.dbline 819
; }
; 
; void odd_BC_servo_up_45(void) {
	.dbline 820
; 	angle_1B(45);
	ldi R16,45
	xcall _angle_1B
	.dbline 821
; 	angle_1C(90);
	ldi R16,90
	xcall _angle_1C
	.dbline 822
; 	angle_3B(45);
	ldi R16,45
	xcall _angle_3B
	.dbline 823
; 	angle_3C(90);
	ldi R16,90
	xcall _angle_3C
	.dbline 824
; 	angle_5B(135);
	ldi R16,135
	xcall _angle_5B
	.dbline 825
; 	angle_5C(90);
	ldi R16,90
	xcall _angle_5C
	.dbline -2
L138:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e odd_BC_servo_down_45 _odd_BC_servo_down_45 fV
	.even
_odd_BC_servo_down_45::
	.dbline -1
	.dbline 828
; }
; 
; void odd_BC_servo_down_45(void) {
	.dbline 829
; 	angle_1B(135);
	ldi R16,135
	xcall _angle_1B
	.dbline 830
; 	angle_1C(135);
	ldi R16,135
	xcall _angle_1C
	.dbline 831
; 	angle_3B(135);
	ldi R16,135
	xcall _angle_3B
	.dbline 832
; 	angle_3C(135);
	ldi R16,135
	xcall _angle_3C
	.dbline 833
; 	angle_5B(45);
	ldi R16,45
	xcall _angle_5B
	.dbline 834
; 	angle_5C(45);
	ldi R16,45
	xcall _angle_5C
	.dbline -2
L139:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e robot_rotate_clockwise_7_5 _robot_rotate_clockwise_7_5 fV
	.even
_robot_rotate_clockwise_7_5::
	.dbline -1
	.dbline 837
; }
; 
; void robot_rotate_clockwise_7_5(void) {
	.dbline 838
; 	motion_busy = 1;
	ldi R24,1
	sts _motion_busy,R24
	.dbline 839
; 	servo_calibration();
	xcall _servo_calibration
	.dbline 840
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 841
; 	even_A_servo_65();
	xcall _even_A_servo_65
	.dbline 842
; 	even_BC_servo_up_45();
	xcall _even_BC_servo_up_45
	.dbline 843
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 844
; 	even_BC_servo_90();
	xcall _even_BC_servo_90
	.dbline 845
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 846
; 	odd_A_servo_65();
	xcall _odd_A_servo_65
	.dbline 847
; 	odd_BC_servo_up_45();
	xcall _odd_BC_servo_up_45
	.dbline 848
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 849
; 	odd_BC_servo_90();
	xcall _odd_BC_servo_90
	.dbline 850
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 851
; 	even_A_servo_90();
	xcall _even_A_servo_90
	.dbline 852
; 	odd_A_servo_90();
	xcall _odd_A_servo_90
	.dbline 853
; 	motion_busy = 0;
	clr R2
	sts _motion_busy,R2
	.dbline -2
L140:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e robot_rotate_anticlockwise_7_5 _robot_rotate_anticlockwise_7_5 fV
	.even
_robot_rotate_anticlockwise_7_5::
	.dbline -1
	.dbline 856
; }
; 
; void robot_rotate_anticlockwise_7_5(void) {
	.dbline 857
; 	motion_busy = 1;
	ldi R24,1
	sts _motion_busy,R24
	.dbline 858
; 	servo_calibration();
	xcall _servo_calibration
	.dbline 859
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 860
; 	even_A_servo_115();
	xcall _even_A_servo_115
	.dbline 861
; 	even_BC_servo_up_45();
	xcall _even_BC_servo_up_45
	.dbline 862
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 863
; 	even_BC_servo_90();
	xcall _even_BC_servo_90
	.dbline 864
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 865
; 	odd_A_servo_115();
	xcall _odd_A_servo_115
	.dbline 866
; 	odd_BC_servo_up_45();
	xcall _odd_BC_servo_up_45
	.dbline 867
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 868
; 	odd_BC_servo_90();
	xcall _odd_BC_servo_90
	.dbline 869
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 870
; 	even_A_servo_90();
	xcall _even_A_servo_90
	.dbline 871
; 	odd_A_servo_90();
	xcall _odd_A_servo_90
	.dbline 872
; 	motion_busy = 0;
	clr R2
	sts _motion_busy,R2
	.dbline -2
L141:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e forward _forward fV
	.even
_forward::
	.dbline -1
	.dbline 876
; }
; 
; //forward by using two legs at a time
; void forward(void) {
	.dbline 877
; 	motion_busy = 1;
	ldi R24,1
	sts _motion_busy,R24
	.dbline 878
; 	servo_calibration();
	xcall _servo_calibration
	.dbline 879
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 882
; 
; 	//legs 2 and 4 move forward
; 	angle_2B(45);
	ldi R16,45
	xcall _angle_2B
	.dbline 883
; 	angle_2C(45);
	ldi R16,45
	xcall _angle_2C
	.dbline 884
; 	angle_4B(135);
	ldi R16,135
	xcall _angle_4B
	.dbline 885
; 	angle_4C(135); //front pair BC servo up 45
	ldi R16,135
	xcall _angle_4C
	.dbline 886
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 887
; 	angle_2A(45);
	ldi R16,45
	xcall _angle_2A
	.dbline 888
; 	angle_4A(135); //front pair move forward while legs are up
	ldi R16,135
	xcall _angle_4A
	.dbline 889
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 890
; 	angle_2B(90);
	ldi R16,90
	xcall _angle_2B
	.dbline 891
; 	angle_2C(90);
	ldi R16,90
	xcall _angle_2C
	.dbline 892
; 	angle_4B(90);
	ldi R16,90
	xcall _angle_4B
	.dbline 893
; 	angle_4C(90); // put down legs
	ldi R16,90
	xcall _angle_4C
	.dbline 894
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 898
; 
; 	//legs 1 and 6 move forward
; 
; 	angle_1B(45);
	ldi R16,45
	xcall _angle_1B
	.dbline 899
; 	angle_1C(45);
	ldi R16,45
	xcall _angle_1C
	.dbline 900
; 	angle_6B(135);
	ldi R16,135
	xcall _angle_6B
	.dbline 901
; 	angle_6C(135); //middel pair BC servo up 45
	ldi R16,135
	xcall _angle_6C
	.dbline 902
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 903
; 	angle_1A(45);
	ldi R16,45
	xcall _angle_1A
	.dbline 904
; 	angle_6A(135); //middel pair move back while legs are up
	ldi R16,135
	xcall _angle_6A
	.dbline 905
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 906
; 	angle_1B(90);
	ldi R16,90
	xcall _angle_1B
	.dbline 907
; 	angle_1C(90);
	ldi R16,90
	xcall _angle_1C
	.dbline 908
; 	angle_6B(90);
	ldi R16,90
	xcall _angle_6B
	.dbline 909
; 	angle_6C(90); // put down legs
	ldi R16,90
	xcall _angle_6C
	.dbline 910
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 913
; 
; 	//legs 3 and 5 move forward
; 	angle_3B(45);
	ldi R16,45
	xcall _angle_3B
	.dbline 914
; 	angle_3C(45);
	ldi R16,45
	xcall _angle_3C
	.dbline 915
; 	angle_5B(135);
	ldi R16,135
	xcall _angle_5B
	.dbline 916
; 	angle_5C(135); //middel pair BC servo up 45
	ldi R16,135
	xcall _angle_5C
	.dbline 917
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 918
; 	angle_3A(45);
	ldi R16,45
	xcall _angle_3A
	.dbline 919
; 	angle_5A(135); //middel pair move forward while legs are up
	ldi R16,135
	xcall _angle_5A
	.dbline 920
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 921
; 	angle_3B(90);
	ldi R16,90
	xcall _angle_3B
	.dbline 922
; 	angle_3C(90);
	ldi R16,90
	xcall _angle_3C
	.dbline 923
; 	angle_5B(90);
	ldi R16,90
	xcall _angle_5B
	.dbline 924
; 	angle_5C(90); // put down legs
	ldi R16,90
	xcall _angle_5C
	.dbline 925
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 927
; 
; 	servo_calibration(); //push towards forward
	xcall _servo_calibration
	.dbline 928
; 	motion_busy = 0;
	clr R2
	sts _motion_busy,R2
	.dbline -2
L142:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e back _back fV
	.even
_back::
	.dbline -1
	.dbline 932
; }
; 
; //backward by using two legs at a time
; void back(void) {
	.dbline 933
; 	motion_busy = 1;
	ldi R24,1
	sts _motion_busy,R24
	.dbline 934
; 	servo_calibration();
	xcall _servo_calibration
	.dbline 935
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 938
; 
; 	//legs 2 and 4 move back
; 	angle_2B(45);
	ldi R16,45
	xcall _angle_2B
	.dbline 939
; 	angle_2C(45);
	ldi R16,45
	xcall _angle_2C
	.dbline 940
; 	angle_4B(135);
	ldi R16,135
	xcall _angle_4B
	.dbline 941
; 	angle_4C(135); //front pair BC servo up 45
	ldi R16,135
	xcall _angle_4C
	.dbline 942
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 943
; 	angle_2A(135);
	ldi R16,135
	xcall _angle_2A
	.dbline 944
; 	angle_4A(45); //front pair move forward while legs are up
	ldi R16,45
	xcall _angle_4A
	.dbline 945
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 946
; 	angle_2B(90);
	ldi R16,90
	xcall _angle_2B
	.dbline 947
; 	angle_2C(90);
	ldi R16,90
	xcall _angle_2C
	.dbline 948
; 	angle_4B(90);
	ldi R16,90
	xcall _angle_4B
	.dbline 949
; 	angle_4C(90); // put down legs
	ldi R16,90
	xcall _angle_4C
	.dbline 950
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 954
; 
; 	//legs 1 and 6 move back
; 
; 	angle_1B(45);
	ldi R16,45
	xcall _angle_1B
	.dbline 955
; 	angle_1C(45);
	ldi R16,45
	xcall _angle_1C
	.dbline 956
; 	angle_6B(135);
	ldi R16,135
	xcall _angle_6B
	.dbline 957
; 	angle_6C(135); //middel pair BC servo up 45
	ldi R16,135
	xcall _angle_6C
	.dbline 958
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 959
; 	angle_1A(135);
	ldi R16,135
	xcall _angle_1A
	.dbline 960
; 	angle_6A(45); //middel pair move back while legs are up
	ldi R16,45
	xcall _angle_6A
	.dbline 961
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 962
; 	angle_1B(90);
	ldi R16,90
	xcall _angle_1B
	.dbline 963
; 	angle_1C(90);
	ldi R16,90
	xcall _angle_1C
	.dbline 964
; 	angle_6B(90);
	ldi R16,90
	xcall _angle_6B
	.dbline 965
; 	angle_6C(90); // put down legs
	ldi R16,90
	xcall _angle_6C
	.dbline 966
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 969
; 
; 	//legs 3 and 5 move back
; 	angle_3B(45);
	ldi R16,45
	xcall _angle_3B
	.dbline 970
; 	angle_3C(45);
	ldi R16,45
	xcall _angle_3C
	.dbline 971
; 	angle_5B(135);
	ldi R16,135
	xcall _angle_5B
	.dbline 972
; 	angle_5C(135); //middel pair BC servo up 45
	ldi R16,135
	xcall _angle_5C
	.dbline 973
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 974
; 	angle_3A(135);
	ldi R16,135
	xcall _angle_3A
	.dbline 975
; 	angle_5A(45); //middel pair move forward while legs are up
	ldi R16,45
	xcall _angle_5A
	.dbline 976
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 977
; 	angle_3B(90);
	ldi R16,90
	xcall _angle_3B
	.dbline 978
; 	angle_3C(90);
	ldi R16,90
	xcall _angle_3C
	.dbline 979
; 	angle_5B(90);
	ldi R16,90
	xcall _angle_5B
	.dbline 980
; 	angle_5C(90); // put down legs
	ldi R16,90
	xcall _angle_5C
	.dbline 981
; 	delay(TWO_HUNDRED_FIFTY_MSEC);
	ldi R16,100
	ldi R17,0
	xcall _delay
	.dbline 983
; 
; 	servo_calibration(); //push towards back
	xcall _servo_calibration
	.dbline 984
; 	motion_busy = 0;
	clr R2
	sts _motion_busy,R2
	.dbline -2
L143:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e robot_standup _robot_standup fV
	.even
_robot_standup::
	.dbline -1
	.dbline 989
; }
; 
; 
; void robot_standup(void) //warning: do not call this function while robot is standing or servos will get damaged
; {
	.dbline 990
; 	motion_busy = 1;
	ldi R24,1
	sts _motion_busy,R24
	.dbline 991
; 	angle_1B(1);
	ldi R16,1
	xcall _angle_1B
	.dbline 992
; 	angle_1C(110);
	ldi R16,110
	xcall _angle_1C
	.dbline 993
; 	angle_2B(1);
	ldi R16,1
	xcall _angle_2B
	.dbline 994
; 	angle_2C(110);
	ldi R16,110
	xcall _angle_2C
	.dbline 995
; 	angle_3B(1);
	ldi R16,1
	xcall _angle_3B
	.dbline 996
; 	angle_3C(110);
	ldi R16,110
	xcall _angle_3C
	.dbline 997
; 	angle_4B(179);
	ldi R16,179
	xcall _angle_4B
	.dbline 998
; 	angle_4C(70);
	ldi R16,70
	xcall _angle_4C
	.dbline 999
; 	angle_5B(179);
	ldi R16,179
	xcall _angle_5B
	.dbline 1000
; 	angle_5C(70);
	ldi R16,70
	xcall _angle_5C
	.dbline 1001
; 	angle_6B(179);
	ldi R16,179
	xcall _angle_6B
	.dbline 1002
; 	angle_6C(70);
	ldi R16,70
	xcall _angle_6C
	.dbline 1003
; 	delay(ONE_SEC);
	ldi R16,400
	ldi R17,1
	xcall _delay
	.dbline 1004
; 	delay(ONE_SEC);
	ldi R16,400
	ldi R17,1
	xcall _delay
	.dbline 1005
; 	servo_calibration();
	xcall _servo_calibration
	.dbline 1006
; 	motion_busy = 0;
	clr R2
	sts _motion_busy,R2
	.dbline -2
L144:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e buzzer_on _buzzer_on fV
	.even
_buzzer_on::
	.dbline -1
	.dbline 1010
; }
; 
; //set buzzer on
; void buzzer_on(void) {
	.dbline 1011
; 	PORTC = PORTC | 0x08;
	sbi 0x8,3
	.dbline -2
L145:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e buzzer_off _buzzer_off fV
	.even
_buzzer_off::
	.dbline -1
	.dbline 1015
; }
; 
; //set buzzer off
; void buzzer_off(void) {
	.dbline 1016
; 	PORTC = PORTC & 0xF7;
	in R24,0x8
	andi R24,247
	out 0x8,R24
	.dbline -2
L146:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay _delay fV
;           time -> R16,R17
	.even
_delay::
	.dbline -1
	.dbline 1072
; }
; 
; /*
; void remote_control(void) {
; 	unsigned char flag1 = 0;
; 	PORTA = remote_data[4]; //move left joystick up and down and see if there is any change in the bargraph display.
; 	flag1 = 0; //resetting the flag
; 
; 	if ((flag1 == 0) && (motion_busy == 0)) //forward, 1 beep
; 	{
; 		if (remote_data[4] > 0x29) {
; 			flag1 = 1;
; 			forward();
; 			//buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off(); //use it to debug remote onnection
; 		}
; 	}
; 
; 	if ((flag1 == 0) && (motion_busy == 0)) //back, 2 beep
; 	{
; 		if (remote_data[4] < 0x15) {
; 			flag1 = 1;
; 			back();
; 			//buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off();delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off(); //use it to debug remote onnection
; 		}
; 	}
; 
; 	if ((flag1 == 0) && (motion_busy == 0)) //anticlockwise (left), 3 beep
; 	{
; 		if (remote_data[3] > 0x2D) {
; 			flag1 = 1;
; 			robot_rotate_anticlockwise_7_5();
; 			//buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off();delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off(); //use it to debug remote onnection
; 		}
; 	}
; 
; 	if ((flag1 == 0) && (motion_busy == 0)) //clockwise (right), 4 beep
; 	{
; 		if (remote_data[3] < 0x19) {
; 			flag1 = 1;
; 			robot_rotate_clockwise_7_5();
; 			//buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off();delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off();delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off(); //use it to debug remote onnection
; 		}
; 	}
; 
; 	if ((flag1 == 0) && (motion_busy == 0)) //stop 1 long beep
; 	{
; 		if ((0x19 < remote_data[3] < 0x2D) && (0x15 < remote_data[4] < 0x29)) {
; 			flag1 = 1;
; 			servo_calibration();
; 			//buzzer_on(); delay(TWO_HUNDRED_FIFTY_MSEC); delay(TWO_HUNDRED_FIFTY_MSEC); delay(TWO_HUNDRED_FIFTY_MSEC); buzzer_off(); //use it to debug remote onnection
; 		}
; 	}
; }*/
; 
; 
; void delay(int time) {
	.dbline 1073
; 	delay_count = 0;
	clr R2
	clr R3
	sts _delay_count+1,R3
	sts _delay_count,R2
L148:
	.dbline 1075
; 	while (delay_count < time)
; 		;
L149:
	.dbline 1074
	lds R2,_delay_count
	lds R3,_delay_count+1
	cp R2,R16
	cpc R3,R17
	brlo L148
X26:
	.dbline -2
L147:
	.dbline 0 ; func end
	ret
	.dbsym r time 16 I
	.dbend
	.dbfunc e ADC_Conversion _ADC_Conversion fc
;              a -> R10
;             Ch -> R16
	.even
_ADC_Conversion::
	st -y,R10
	.dbline -1
	.dbline 1079
; }
; 
; unsigned char ADC_Conversion(unsigned char Ch)
; {
	.dbline 1081
; 	unsigned char a;
; 	if(Ch>7)
	ldi R24,7
	cp R24,R16
	brsh L152
X27:
	.dbline 1082
; 		{
	.dbline 1083
; 		ADCSRB = 0x08;			// select the ch. > 7
	ldi R24,8
	sts 123,R24
	.dbline 1084
; 		}
L152:
	.dbline 1085
; 	Ch = Ch & 0x07;  			
	andi R16,7
	.dbline 1086
; 	ADMUX= 0x20| Ch;	   		//do not disturb the left adjustment
	mov R24,R16
	ori R24,32
	sts 124,R24
	.dbline 1087
; 	ADCSRA = ADCSRA | 0x40;		//Set start conversion bit
	lds R24,122
	ori R24,64
	sts 122,R24
L154:
	.dbline 1088
; 	while((ADCSRA&0x10)==0);	//Wait for ADC conversion to complete
L155:
	.dbline 1088
	lds R2,122
	sbrs R2,4
	rjmp L154
X28:
	.dbline 1089
; 	a=ADCH;
	lds R10,121
	.dbline 1090
; 	ADCSRA = ADCSRA|0x10; 		//clear ADIF (ADC Interrupt Flag) by writing 1 to it
	lds R24,122
	ori R24,16
	sts 122,R24
	.dbline 1091
; 	ADCSRB = 0x00;
	clr R2
	sts 123,R2
	.dbline 1092
; 	return a;
	mov R16,R10
	.dbline -2
L151:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r a 10 c
	.dbsym r Ch 16 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\BUILDI~1\hexapod.c
_data::
	.blkb 1
	.dbsym e data _data c
_remote_data::
	.blkb 8
	.dbsym e remote_data _remote_data A[8:8]c
_angle_lower_byte_6C::
	.blkb 2
	.dbsym e angle_lower_byte_6C _angle_lower_byte_6C I
_angle_upper_byte_6C::
	.blkb 2
	.dbsym e angle_upper_byte_6C _angle_upper_byte_6C I
_angle_lower_byte_6B::
	.blkb 2
	.dbsym e angle_lower_byte_6B _angle_lower_byte_6B I
_angle_upper_byte_6B::
	.blkb 2
	.dbsym e angle_upper_byte_6B _angle_upper_byte_6B I
_angle_lower_byte_6A::
	.blkb 1
	.dbsym e angle_lower_byte_6A _angle_lower_byte_6A c
_angle_upper_byte_6A::
	.blkb 1
	.dbsym e angle_upper_byte_6A _angle_upper_byte_6A c
_angle_lower_byte_5C::
	.blkb 2
	.dbsym e angle_lower_byte_5C _angle_lower_byte_5C I
_angle_upper_byte_5C::
	.blkb 2
	.dbsym e angle_upper_byte_5C _angle_upper_byte_5C I
_angle_lower_byte_5B::
	.blkb 2
	.dbsym e angle_lower_byte_5B _angle_lower_byte_5B I
_angle_upper_byte_5B::
	.blkb 2
	.dbsym e angle_upper_byte_5B _angle_upper_byte_5B I
_angle_lower_byte_5A::
	.blkb 1
	.dbsym e angle_lower_byte_5A _angle_lower_byte_5A c
_angle_upper_byte_5A::
	.blkb 1
	.dbsym e angle_upper_byte_5A _angle_upper_byte_5A c
_angle_lower_byte_4C::
	.blkb 2
	.dbsym e angle_lower_byte_4C _angle_lower_byte_4C I
_angle_upper_byte_4C::
	.blkb 2
	.dbsym e angle_upper_byte_4C _angle_upper_byte_4C I
_angle_lower_byte_4B::
	.blkb 2
	.dbsym e angle_lower_byte_4B _angle_lower_byte_4B I
_angle_upper_byte_4B::
	.blkb 2
	.dbsym e angle_upper_byte_4B _angle_upper_byte_4B I
_angle_lower_byte_4A::
	.blkb 1
	.dbsym e angle_lower_byte_4A _angle_lower_byte_4A c
_angle_upper_byte_4A::
	.blkb 1
	.dbsym e angle_upper_byte_4A _angle_upper_byte_4A c
_angle_lower_byte_3C::
	.blkb 2
	.dbsym e angle_lower_byte_3C _angle_lower_byte_3C I
_angle_upper_byte_3C::
	.blkb 2
	.dbsym e angle_upper_byte_3C _angle_upper_byte_3C I
_angle_lower_byte_3B::
	.blkb 2
	.dbsym e angle_lower_byte_3B _angle_lower_byte_3B I
_angle_upper_byte_3B::
	.blkb 2
	.dbsym e angle_upper_byte_3B _angle_upper_byte_3B I
_angle_lower_byte_3A::
	.blkb 1
	.dbsym e angle_lower_byte_3A _angle_lower_byte_3A c
_angle_upper_byte_3A::
	.blkb 1
	.dbsym e angle_upper_byte_3A _angle_upper_byte_3A c
_angle_lower_byte_2C::
	.blkb 2
	.dbsym e angle_lower_byte_2C _angle_lower_byte_2C I
_angle_upper_byte_2C::
	.blkb 2
	.dbsym e angle_upper_byte_2C _angle_upper_byte_2C I
_angle_lower_byte_2B::
	.blkb 2
	.dbsym e angle_lower_byte_2B _angle_lower_byte_2B I
_angle_upper_byte_2B::
	.blkb 2
	.dbsym e angle_upper_byte_2B _angle_upper_byte_2B I
_angle_lower_byte_2A::
	.blkb 1
	.dbsym e angle_lower_byte_2A _angle_lower_byte_2A c
_angle_upper_byte_2A::
	.blkb 1
	.dbsym e angle_upper_byte_2A _angle_upper_byte_2A c
_angle_lower_byte_1C::
	.blkb 2
	.dbsym e angle_lower_byte_1C _angle_lower_byte_1C I
_angle_upper_byte_1C::
	.blkb 2
	.dbsym e angle_upper_byte_1C _angle_upper_byte_1C I
_angle_lower_byte_1B::
	.blkb 2
	.dbsym e angle_lower_byte_1B _angle_lower_byte_1B I
_angle_upper_byte_1B::
	.blkb 2
	.dbsym e angle_upper_byte_1B _angle_upper_byte_1B I
_angle_lower_byte_1A::
	.blkb 1
	.dbsym e angle_lower_byte_1A _angle_lower_byte_1A c
_angle_upper_byte_1A::
	.blkb 1
	.dbsym e angle_upper_byte_1A _angle_upper_byte_1A c
; }
; 
