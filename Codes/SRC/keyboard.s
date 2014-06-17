	.module keyboard.c
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\keyboard.c
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\keyboard.c
L2:
	.blkb 1
	.area idata
	.byte 15
	.area data(ram, con, rel)
	.dbfile D:\BUILDI~1\keyboard.c
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\keyboard.c
	.dbfunc e keyboard_control _keyboard_control fV
	.area efunc_lit(rom, con, rel)
L22:
	.eaddr `L12
	.eaddr `L14
	.eaddr `L18
	.eaddr `L9
	.eaddr `L8
	.eaddr `L3
	.eaddr `L3
	.eaddr `L3
	.eaddr `L3
	.eaddr `L3
	.eaddr `L16
	.eaddr `L17
	.eaddr `L3
	.eaddr `L3
	.eaddr `L3
	.eaddr `L15
	.eaddr `L3
	.eaddr `L3
	.eaddr `L6
	.eaddr `L13
	.eaddr `L3
	.eaddr `L3
	.eaddr `L7
	.eaddr `L10
	.eaddr `L3
	.eaddr `L11
	.area text(rom, con, rel)
	.dbsym s change L2 c
	.even
_keyboard_control::
	st -y,R20
	st -y,R21
	sbiw R28,2
	.dbline -1
	.dbline 69
; /***
; Author : Srijit Dutt
; Date Sun 07 Nov 2010 02:42:38 PM IST 
; 
; keyboard.c : File contains various advanced motion functions for the hexapod
; Please include keyboard.h file to call function from this file
; 
; The various functions are : 
; keyboard_control
; */
; 
; /*********************************************************************************
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
; 
; 
; #include "hexapod_macro.h"
; #include "hexapod.h"
; #include "gait.h"
; #include "hexapod_motions.h"
; #include "hexapod_basic.h"
; 
; 
; extern unsigned char data;//!< The keyborad command given by user
; 
; 
; /**
; Controls hexapod through keyboard using ZigBee communication
; */
; void keyboard_control(void) {
	.dbline 73
; 	
; 	static char change = 15;
; 	
; 	switch(data) {
	lds R20,_data
	clr R21
	cpi R20,60
	ldi R30,0
	cpc R21,R30
	brne X6
	xjmp L20
X6:
X0:
	cpi R20,62
	ldi R30,0
	cpc R21,R30
	brne X7
	xjmp L19
X7:
X1:
	cpi R20,60
	ldi R30,0
	cpc R21,R30
	brge X8
	xjmp L3
X8:
X2:
L21:
	cpi R20,97
	ldi R30,0
	cpc R21,R30
	brge X9
	xjmp L3
X9:
X3:
	ldi R24,122
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brge X10
	xjmp L3
X10:
X4:
	ldi R16,3
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	ldi R24,<L22-291
	ldi R25,>L22-291
	add R30,R24
	adc R31,R25
	elpm R2,Z+
	elpm R3,Z+
	elpm R0,Z
	out 0x3C,R0
	movw R30,R2
	eijmp
X5:
	.dbfile D:\BUILDI~1\keyboard.c
	.dbline 73
L6:
	.dbline 75
; 	   case 's':
; 	   		servo_calibration();
	xcall _servo_calibration
	.dbline 76
; 	   		break;
	xjmp L4
L7:
	.dbline 78
; 	   case 'w': 
; 	         tripod_gait(LEG_2, 1);
	ldi R18,1
	ldi R16,2
	xcall _tripod_gait
	.dbline 79
; 			 break;	
	xjmp L4
L8:
	.dbline 81
; 	   case 'e': 
; 	         tripod_gait(LEG_1, 1);
	ldi R18,1
	ldi R16,1
	xcall _tripod_gait
	.dbline 82
; 			 break;
	xjmp L4
L9:
	.dbline 84
; 	   case 'd': 
; 	         tripod_gait(LEG_4, 1);
	ldi R18,1
	ldi R16,4
	xcall _tripod_gait
	.dbline 85
; 			 break;
	xjmp L4
L10:
	.dbline 87
; 	   case 'x': 
; 	         tripod_gait(LEG_5, 1);
	ldi R18,1
	ldi R16,5
	xcall _tripod_gait
	.dbline 88
; 			 break;
	xjmp L4
L11:
	.dbline 90
; 	   case 'z': 
; 	         tripod_gait(LEG_6, 1);
	ldi R18,1
	ldi R16,6
	xcall _tripod_gait
	.dbline 91
; 			 break;
	xjmp L4
L12:
	.dbline 93
; 	   case 'a': 
; 	         tripod_gait(LEG_3, 1);
	ldi R18,1
	ldi R16,3
	xcall _tripod_gait
	.dbline 94
; 			 break;	 	
	xjmp L4
L13:
	.dbline 96
; 	   case 't': 
; 			two_leg_gait(1, 2, 1);
	ldi R24,1
	ldi R25,0
	std y+1,R25
	std y+0,R24
	ldi R18,2
	ldi R16,1
	xcall _two_leg_gait
	.dbline 97
; 			break;
	xjmp L4
L14:
	.dbline 99
; 	   case 'b':
; 	   		buzzer_on_off();
	xcall _buzzer_on_off
	.dbline 100
; 			break;
	xjmp L4
L15:
	.dbline 102
; 	   case 'p':
; 	   		pose(LEG_1, LEG_2, 10);
	ldi R24,10
	ldi R25,0
	std y+1,R25
	std y+0,R24
	ldi R18,2
	ldi R16,1
	xcall _pose
	.dbline 103
; 			break;
	xjmp L4
L16:
	.dbline 105
; 	   case 'k':
; 	        sway(24, CLOCK_WISE);
	ldi R18,1
	ldi R16,24
	ldi R17,0
	xcall _sway
	.dbline 106
; 	        break;
	xjmp L4
L17:
	.dbline 108
; 	   case 'l':
; 	        dance(4,5,6);
	ldi R24,6
	ldi R25,0
	std y+1,R25
	std y+0,R24
	ldi R18,5
	ldi R16,4
	xcall _dance
	.dbline 109
; 	        break;				
	xjmp L4
L18:
	.dbline 111
; 	   case 'c' :
; 	        climb();
	xcall _climb
	.dbline 112
; 			break;
	xjmp L4
L19:
	.dbline 114
; 	   case '>' :
; 		    robot_rotate_clockwise_7_5();
	xcall _robot_rotate_clockwise_7_5
	.dbline 115
; 			break;	
	xjmp L4
L20:
	.dbline 117
; 	   case '<' :
; 		    robot_rotate_anticlockwise_7_5();
	xcall _robot_rotate_anticlockwise_7_5
	.dbline 118
; 			break;		
	xjmp L4
L3:
	.dbline 254
; 			
; 	   /*case '+':
; 	        angle_change(LEG_1, MOTOR_A, change);
; 			break;
; 	   case '-':
; 	        angle_change(LEG_1, MOTOR_A, -change);
; 			break;	
; 	   case '*':
; 	        change += 5;
; 			if(change > 90)
; 			    change = 90;
; 			break;
; 	   case '/':
; 	        change += -5;
; 			if(change < 5)
; 			   change = 5;
; 			break;*/
; 			
; 			
; 		/*	
; 	   case '`':
; 	        angle_change(LEG_1, MOTOR_A, change);
; 			break;
; 	   case '~':
; 	        angle_change(LEG_1, MOTOR_A, -change);
; 			break;
; 	   case '1':
; 	        angle_change(LEG_1, MOTOR_B, change);
; 			break;
; 	   case '!':
; 	        angle_change(LEG_1, MOTOR_B, -change);
; 			break;
; 		case '2':
; 	        angle_change(LEG_1, MOTOR_C, change);
; 			break;
; 	   case '@':
; 	        angle_change(LEG_1, MOTOR_C, -change);
; 			break;
; 			
; 		case '3':
; 	        angle_change(LEG_2, MOTOR_A, change);
; 			break;
; 	   case '#':
; 	        angle_change(LEG_2, MOTOR_A, -change);
; 			break;
; 	   case '4':
; 	        angle_change(LEG_2, MOTOR_B, change);
; 			break;
; 	   case '$':
; 	        angle_change(LEG_2, MOTOR_B, -change);
; 			break;
; 		case '5':
; 	        angle_change(LEG_2, MOTOR_C, change);
; 			break;
; 	   case '%':
; 	        angle_change(LEG_2, MOTOR_C, -change);
; 			break;
; 		
; 		case '6':
; 	        angle_change(LEG_3, MOTOR_A, change);
; 			break;
; 	   case '^':
; 	        angle_change(LEG_3, MOTOR_A, -change);
; 			break;
; 	   case '7':
; 	        angle_change(LEG_3, MOTOR_B, change);
; 			break;
; 	   case '&':
; 	        angle_change(LEG_3, MOTOR_B, -change);
; 			break;
; 		case '8':
; 	        angle_change(LEG_3, MOTOR_C, change);
; 			break;
; 	   case '*':
; 	        angle_change(LEG_3, MOTOR_C, -change);
; 			break;
; 		
; 		case '9':
; 	        angle_change(LEG_4, MOTOR_A, change);
; 			break;
; 	   case '(':
; 	        angle_change(LEG_4, MOTOR_A, -change);
; 			break;
; 	   case '0':
; 	        angle_change(LEG_4, MOTOR_B, change);
; 			break;
; 	   case ')':
; 	        angle_change(LEG_4, MOTOR_B, -change);
; 			break;
; 		case '-':
; 	        angle_change(LEG_4, MOTOR_C, change);
; 			break;
; 	   case '_':
; 	        angle_change(LEG_4, MOTOR_C, -change);
; 			break;
; 		
; 		case '=':
; 	        angle_change(LEG_5, MOTOR_A, change);
; 			break;
; 	   case '+':
; 	        angle_change(LEG_5, MOTOR_A, -change);
; 			break;
; 	   case '[':
; 	        angle_change(LEG_5, MOTOR_B, change);
; 			break;
; 	   case '{':
; 	        angle_change(LEG_5, MOTOR_B, -change);
; 			break;
; 		case ']':
; 	        angle_change(LEG_5, MOTOR_C, change);
; 			break;
; 	   case '}':
; 	        angle_change(LEG_5, MOTOR_C, -change);
; 			break;
; 		
; 		case '\\':
; 	        angle_change(LEG_6, MOTOR_A, change);
; 			break;
; 	   case '|':
; 	        angle_change(LEG_6, MOTOR_A, -change);
; 			break;
; 	   case ';':
; 	        angle_change(LEG_6, MOTOR_B, change);
; 			break;
; 	   case ':':
; 	        angle_change(LEG_6, MOTOR_B, -change);
; 			break;
; 		case '\'':
; 	        angle_change(LEG_6, MOTOR_C, change);
; 			break;
; 	   case '\"':
; 	        angle_change(LEG_6, MOTOR_C, -change);
; 			break;
; 		*/		
; 		default :
; 		    buzzer_on();
	xcall _buzzer_on
	.dbline 255
; 			break;
L4:
	.dbline 258
; 	}	           
; 	 	
; 	data = '';
	clr R2
	sts _data,R2
	.dbline -2
L1:
	.dbline 0 ; func end
	adiw R28,2
	ld R21,y+
	ld R20,y+
	ret
	.dbend
; }
