	.module gait.c
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\gait.c
	.dbfunc e tripod_gait _tripod_gait fV
;   step_forward -> R20
;     delay_time -> R14,R15
;      step_side -> R12
;           dir6 -> R10
;           dir4 -> y+4
;           dir2 -> y+3
;           dir5 -> y+2
;           dir3 -> y+1
;           lift -> R22
;          steps -> y+17
;           dir1 -> y+15
	.even
_tripod_gait::
	xcall push_arg4
	xcall push_xgsetF0FC
	sbiw R28,5
	.dbline -1
	.dbline 66
; /***
; Author : Srijit Dutt
; Date Sun 07 Nov 2010 02:42:38 PM IST 
; 
; gait.c : File contains various walking motion functions for the hexapod
; Please include gait.h file to call function from this file
; 
; */
; 
; 
; /********************************************************************************
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
; #include "hexapod_macro.h"
; #include "hexapod_basic.h"
; #include "hexapod.h"
; 
; 
; /**
; Tripod gait moves the hexapod in the direction dir1 for steps.
; Three legs forming a tripod move first then the other three legs move  
; Used for normal gait of the hexapod
; @param dir1 : Direction of motion
; @param steps : number of steps
; 
; */
; void tripod_gait(unsigned char dir1, unsigned char steps) {
	.dbline 67
; 	unsigned char dir3 = ((dir1 + 1) % 6) + 1;
	ldi R17,6
	ldd R16,y+15
	subi R16,255    ; addi 1
	xcall mod8u
	mov R24,R16
	subi R24,255    ; addi 1
	std y+1,R24
	.dbline 68
; 	unsigned char dir5 = ((dir3 + 1) % 6) + 1;
	ldi R17,6
	mov R16,R24
	subi R16,255    ; addi 1
	xcall mod8u
	mov R24,R16
	subi R24,255    ; addi 1
	std y+2,R24
	.dbline 69
; 	unsigned char dir2 = 7 - dir5;
	mov R2,R24
	ldi R24,7
	sub R24,R2
	std y+3,R24
	.dbline 70
; 	unsigned char dir4 = 7 - dir3;
	ldd R2,y+1
	ldi R24,7
	sub R24,R2
	std y+4,R24
	.dbline 71
; 	unsigned char dir6 = 7 - dir1;
	ldi R24,7
	mov R10,R24
	ldd R0,y+15
	sub R10,R0
	.dbline 72
; 	unsigned char step_forward = 70;
	ldi R20,70
	.dbline 73
; 	unsigned char step_side = 50;
	ldi R24,50
	mov R12,R24
	.dbline 74
; 	unsigned char lift = 40;
	ldi R22,40
	.dbline 75
; 	int delay_time = TWO_HUNDRED_FIFTY_MSEC;
	ldi R24,100
	ldi R25,0
	movw R14,R24
	.dbline 78
; 	
; 	
; 	if(dir1%2 == 0) {
	ldi R17,2
	mov R16,R0
	xcall mod8u
	tst R16
	breq X2
	xjmp L5
X2:
X0:
	.dbline 78
	.dbline 79
; 		swap(&dir2, &dir4);
	movw R18,R28
	subi R18,252  ; offset = 4
	sbci R19,255
	movw R16,R28
	subi R16,253  ; offset = 3
	sbci R17,255
	xcall _swap
	.dbline 80
; 		swap(&dir3, &dir5);	  
	movw R18,R28
	subi R18,254  ; offset = 2
	sbci R19,255
	movw R16,R28
	subi R16,255  ; offset = 1
	sbci R17,255
	xcall _swap
	.dbline 81
; 	}
	xjmp L5
L4:
	.dbline 83
; 	
; 	while (steps-- > 0) {
	.dbline 86
; 
; 		//puuting down odd tripod
; 		angle(dir1, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+15
	xcall _angle
	.dbline 87
; 		angle(dir3, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+1
	xcall _angle
	.dbline 88
; 		angle(dir5, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+2
	xcall _angle
	.dbline 90
; 		
; 		delay(HUNDRED_MSEC);
	ldi R16,40
	ldi R17,0
	xcall _delay
	.dbline 93
; 		
; 		//picking up even tripod
; 		angle(dir2, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+3
	xcall _angle
	.dbline 94
; 		angle(dir4, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+4
	xcall _angle
	.dbline 95
; 		angle(dir6, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	mov R16,R10
	xcall _angle
	.dbline 96
; 		delay(delay_time);
	movw R16,R14
	xcall _delay
	.dbline 99
; 
; 		//moving body on odd tripod
; 		angle(dir1, MOTOR_C, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,67
	ldd R16,y+15
	xcall _angle
	.dbline 100
; 		angle(dir3, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+1
	xcall _angle
	.dbline 101
; 		angle(dir5, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+2
	xcall _angle
	.dbline 103
; 		//moving legs even forward in air
; 		angle(dir2, MOTOR_A, 90 - step_side);
	ldi R24,90
	sub R24,R12
	std y+0,R24
	ldi R18,65
	ldd R16,y+3
	xcall _angle
	.dbline 104
; 		angle(dir4, MOTOR_A, 90 + step_side);
	mov R24,R12
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+4
	xcall _angle
	.dbline 105
; 		angle(dir6, MOTOR_C, 90 + step_forward);
	mov R24,R20
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,67
	mov R16,R10
	xcall _angle
	.dbline 106
; 		delay(delay_time);
	movw R16,R14
	xcall _delay
	.dbline 109
; 
; 		//putting down even legs
; 		angle(dir2, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+3
	xcall _angle
	.dbline 110
; 		angle(dir4, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+4
	xcall _angle
	.dbline 111
; 		angle(dir6, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	mov R16,R10
	xcall _angle
	.dbline 113
; 		
; 		delay(HUNDRED_MSEC);
	ldi R16,40
	ldi R17,0
	xcall _delay
	.dbline 116
; 		
; 		//picking up odd legs
; 		angle(dir1, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+15
	xcall _angle
	.dbline 117
; 		angle(dir3, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+1
	xcall _angle
	.dbline 118
; 		angle(dir5, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+2
	xcall _angle
	.dbline 119
; 		delay(delay_time);
	movw R16,R14
	xcall _delay
	.dbline 122
; 
; 		//moving the odd legs in air
; 		angle(dir1, MOTOR_C, 90 + step_forward);
	mov R24,R20
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,67
	ldd R16,y+15
	xcall _angle
	.dbline 123
; 		angle(dir3, MOTOR_A, 90 - step_side);
	ldi R24,90
	sub R24,R12
	std y+0,R24
	ldi R18,65
	ldd R16,y+1
	xcall _angle
	.dbline 124
; 		angle(dir5, MOTOR_A, 90 + step_side);
	mov R24,R12
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+2
	xcall _angle
	.dbline 126
; 		//moving the body forward on even tripod
; 		angle(dir2, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+3
	xcall _angle
	.dbline 127
; 		angle(dir4, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+4
	xcall _angle
	.dbline 128
; 		angle(dir6, MOTOR_C, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,67
	mov R16,R10
	xcall _angle
	.dbline 129
; 		delay(delay_time);
	movw R16,R14
	xcall _delay
	.dbline 130
; 	}
L5:
	.dbline 83
	ldd R2,y+17
	clr R3
	mov R24,R2
	subi R24,1
	std y+17,R24
	ldi R24,0
	cp R24,R2
	brsh X3
	xjmp L4
X3:
X1:
	.dbline -2
L1:
	.dbline 0 ; func end
	adiw R28,5
	xcall pop_xgsetF0FC
	adiw R28,4
	ret
	.dbsym r step_forward 20 c
	.dbsym r delay_time 14 I
	.dbsym r step_side 12 c
	.dbsym r dir6 10 c
	.dbsym l dir4 4 c
	.dbsym l dir2 3 c
	.dbsym l dir5 2 c
	.dbsym l dir3 1 c
	.dbsym r lift 22 c
	.dbsym l steps 17 c
	.dbsym l dir1 15 c
	.dbend
	.dbfunc e tripod_gait_2 _tripod_gait_2 fV
;    delay_time1 -> R10,R11
;   step_forward -> R20
;      step_side -> R14
;     delay_time -> R12,R13
;           lift -> R22
;           dir6 -> y+5
;           dir4 -> y+4
;           dir2 -> y+3
;           dir5 -> y+2
;           dir3 -> y+1
;          steps -> y+18
;           dir1 -> y+16
	.even
_tripod_gait_2::
	xcall push_arg4
	xcall push_xgsetF0FC
	sbiw R28,6
	.dbline -1
	.dbline 138
; }
; 
; /**
; Tripod Gait 2 : Better suited for uneven terrain
; @param dir1 : Direction of motion
; @param steps : number of steps
; */
; void tripod_gait_2(unsigned char dir1, unsigned char steps) {
	.dbline 139
; 	unsigned char dir3 = ((dir1 + 1) % 6) + 1;
	ldi R17,6
	ldd R16,y+16
	subi R16,255    ; addi 1
	xcall mod8u
	mov R24,R16
	subi R24,255    ; addi 1
	std y+1,R24
	.dbline 140
; 	unsigned char dir5 = ((dir3 + 1) % 6) + 1;
	ldi R17,6
	mov R16,R24
	subi R16,255    ; addi 1
	xcall mod8u
	mov R24,R16
	subi R24,255    ; addi 1
	std y+2,R24
	.dbline 141
; 	unsigned char dir2 = 7 - dir5;
	mov R2,R24
	ldi R24,7
	sub R24,R2
	std y+3,R24
	.dbline 142
; 	unsigned char dir4 = 7 - dir3;
	ldd R2,y+1
	ldi R24,7
	sub R24,R2
	std y+4,R24
	.dbline 143
; 	unsigned char dir6 = 7 - dir1;
	ldi R24,7
	ldd R0,y+16
	sub R24,R0
	std y+5,R24
	.dbline 144
; 	unsigned char step_forward = 60;
	ldi R20,60
	.dbline 145
; 	unsigned char step_side = 60;
	ldi R24,60
	mov R14,R24
	.dbline 146
; 	unsigned char lift = 40;
	ldi R22,40
	.dbline 147
; 	int delay_time = ONE_SEC;
	ldi R24,400
	ldi R25,1
	movw R12,R24
	.dbline 148
; 	int delay_time1 = ONE_SEC;
	movw R10,R24
	.dbline 151
; 	
; 	
; 	if(dir1%2 == 0) {
	ldi R17,2
	ldd R16,y+16
	xcall mod8u
	tst R16
	breq X6
	xjmp L11
X6:
X4:
	.dbline 151
	.dbline 152
; 		swap(&dir2, &dir4);
	movw R18,R28
	subi R18,252  ; offset = 4
	sbci R19,255
	movw R16,R28
	subi R16,253  ; offset = 3
	sbci R17,255
	xcall _swap
	.dbline 153
; 		swap(&dir3, &dir5);	  
	movw R18,R28
	subi R18,254  ; offset = 2
	sbci R19,255
	movw R16,R28
	subi R16,255  ; offset = 1
	sbci R17,255
	xcall _swap
	.dbline 154
; 	}
	xjmp L11
L10:
	.dbline 156
; 	
; 	while (steps-- > 0) {
	.dbline 159
; 
; 		//puuting down odd tripod
; 		angle(dir1, MOTOR_C, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,67
	ldd R16,y+16
	xcall _angle
	.dbline 160
; 		angle(dir3, MOTOR_C, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,67
	ldd R16,y+1
	xcall _angle
	.dbline 161
; 		angle(dir5, MOTOR_C, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,67
	ldd R16,y+2
	xcall _angle
	.dbline 162
; 		angle(dir1, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+16
	xcall _angle
	.dbline 163
; 		angle(dir3, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+1
	xcall _angle
	.dbline 164
; 		angle(dir5, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+2
	xcall _angle
	.dbline 167
; 		
; 				
; 		delay(delay_time1);
	movw R16,R10
	xcall _delay
	.dbline 170
; 		
; 		//picking up even tripod
; 		angle(dir2, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+3
	xcall _angle
	.dbline 171
; 		angle(dir4, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+4
	xcall _angle
	.dbline 172
; 		angle(dir6, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+5
	xcall _angle
	.dbline 173
; 		angle(dir2, MOTOR_C, 0);
	clr R2
	std y+0,R2
	ldi R18,67
	ldd R16,y+3
	xcall _angle
	.dbline 174
; 		angle(dir4, MOTOR_C, 0);
	clr R2
	std y+0,R2
	ldi R18,67
	ldd R16,y+4
	xcall _angle
	.dbline 175
; 		angle(dir6, MOTOR_C, 0);
	clr R2
	std y+0,R2
	ldi R18,67
	ldd R16,y+5
	xcall _angle
	.dbline 176
; 		delay(delay_time);
	movw R16,R12
	xcall _delay
	.dbline 179
; 
; 		//moving body on odd tripod
; 		angle(dir1, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+16
	xcall _angle
	.dbline 180
; 		angle(dir3, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+1
	xcall _angle
	.dbline 181
; 		angle(dir5, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+2
	xcall _angle
	.dbline 183
; 		
; 		delay(delay_time);
	movw R16,R12
	xcall _delay
	.dbline 186
; 		
; 		//moving legs even forward in air
; 		angle(dir2, MOTOR_C, 180);
	ldi R24,180
	std y+0,R24
	ldi R18,67
	ldd R16,y+3
	xcall _angle
	.dbline 187
; 		angle(dir4, MOTOR_C, 180);
	ldi R24,180
	std y+0,R24
	ldi R18,67
	ldd R16,y+4
	xcall _angle
	.dbline 188
; 		angle(dir6, MOTOR_C, 180);
	ldi R24,180
	std y+0,R24
	ldi R18,67
	ldd R16,y+5
	xcall _angle
	.dbline 189
; 		angle(dir2, MOTOR_A, 90 - step_side);
	ldi R24,90
	sub R24,R14
	std y+0,R24
	ldi R18,65
	ldd R16,y+3
	xcall _angle
	.dbline 190
; 		angle(dir4, MOTOR_A, 90 + step_side);
	mov R24,R14
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+4
	xcall _angle
	.dbline 191
; 		angle(dir6, MOTOR_A, 90 + step_forward);
	mov R24,R20
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+5
	xcall _angle
	.dbline 192
; 		delay(delay_time);
	movw R16,R12
	xcall _delay
	.dbline 195
; 
; 		//putting down even legs
; 		angle(dir2, MOTOR_C, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,67
	ldd R16,y+3
	xcall _angle
	.dbline 196
; 		angle(dir4, MOTOR_C, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,67
	ldd R16,y+4
	xcall _angle
	.dbline 197
; 		angle(dir6, MOTOR_C, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,67
	ldd R16,y+5
	xcall _angle
	.dbline 198
; 		angle(dir2, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+3
	xcall _angle
	.dbline 199
; 		angle(dir4, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+4
	xcall _angle
	.dbline 200
; 		angle(dir6, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+5
	xcall _angle
	.dbline 202
; 		
; 		delay(delay_time1);
	movw R16,R10
	xcall _delay
	.dbline 205
; 		
; 		//picking up odd legs
; 		angle(dir1, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+16
	xcall _angle
	.dbline 206
; 		angle(dir3, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+1
	xcall _angle
	.dbline 207
; 		angle(dir5, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+2
	xcall _angle
	.dbline 208
; 		angle(dir1, MOTOR_C, 0);
	clr R2
	std y+0,R2
	ldi R18,67
	ldd R16,y+16
	xcall _angle
	.dbline 209
; 		angle(dir3, MOTOR_C, 0);
	clr R2
	std y+0,R2
	ldi R18,67
	ldd R16,y+1
	xcall _angle
	.dbline 210
; 		angle(dir5, MOTOR_C, 0);
	clr R2
	std y+0,R2
	ldi R18,67
	ldd R16,y+2
	xcall _angle
	.dbline 211
; 		delay(delay_time);
	movw R16,R12
	xcall _delay
	.dbline 214
; 
; 		//moving the odd legs in air
; 		angle(dir1, MOTOR_C, 180);
	ldi R24,180
	std y+0,R24
	ldi R18,67
	ldd R16,y+16
	xcall _angle
	.dbline 215
; 		angle(dir3, MOTOR_C, 180);
	ldi R24,180
	std y+0,R24
	ldi R18,67
	ldd R16,y+1
	xcall _angle
	.dbline 216
; 		angle(dir5, MOTOR_C, 180);
	ldi R24,180
	std y+0,R24
	ldi R18,67
	ldd R16,y+2
	xcall _angle
	.dbline 217
; 		angle(dir1, MOTOR_A, 90 + step_forward);
	mov R24,R20
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+16
	xcall _angle
	.dbline 218
; 		angle(dir3, MOTOR_A, 90 - step_side);
	ldi R24,90
	sub R24,R14
	std y+0,R24
	ldi R18,65
	ldd R16,y+1
	xcall _angle
	.dbline 219
; 		angle(dir5, MOTOR_A, 90 + step_side);
	mov R24,R14
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+2
	xcall _angle
	.dbline 220
; 		delay(delay_time);
	movw R16,R12
	xcall _delay
	.dbline 223
; 		
; 		//moving the body forward on even tripod
; 		angle(dir2, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+3
	xcall _angle
	.dbline 224
; 		angle(dir4, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+4
	xcall _angle
	.dbline 225
; 		angle(dir6, MOTOR_A, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,65
	ldd R16,y+5
	xcall _angle
	.dbline 226
; 		delay(delay_time);
	movw R16,R12
	xcall _delay
	.dbline 227
; 	}
L11:
	.dbline 156
	ldd R2,y+18
	clr R3
	mov R24,R2
	subi R24,1
	std y+18,R24
	ldi R24,0
	cp R24,R2
	brsh X7
	xjmp L10
X7:
X5:
	.dbline -2
L7:
	.dbline 0 ; func end
	adiw R28,6
	xcall pop_xgsetF0FC
	adiw R28,4
	ret
	.dbsym r delay_time1 10 I
	.dbsym r step_forward 20 c
	.dbsym r step_side 14 c
	.dbsym r delay_time 12 I
	.dbsym r lift 22 c
	.dbsym l dir6 5 c
	.dbsym l dir4 4 c
	.dbsym l dir2 3 c
	.dbsym l dir5 2 c
	.dbsym l dir3 1 c
	.dbsym l steps 18 c
	.dbsym l dir1 16 c
	.dbend
	.area lit(rom, con, rel)
L14:
	.byte 0,2
	.byte 3,6
	.byte 1,4
	.byte 5
L15:
	.byte 0,4
	.byte 1,2
	.byte 5,6
	.byte 3
	.area text(rom, con, rel)
	.dbfile D:\BUILDI~1\gait.c
	.dbfunc e two_leg_gait _two_leg_gait fV
;     legs_clock -> y+8
; legs_anticlock -> y+1
;    delay_time2 -> R10,R11
;    delay_time1 -> R14,R15
;      step_side -> R12
;           dir6 -> y+18
;           dir5 -> y+17
;           dir4 -> y+16
;           dir3 -> y+15
;           lift -> R22
;   step_forward -> R20
;          steps -> y+33
;           dir2 -> y+31
;           dir1 -> y+29
	.even
_two_leg_gait::
	xcall push_arg4
	xcall push_xgsetF0FC
	sbiw R28,19
	.dbline -1
	.dbline 236
; }
; 
; /**
; Two leg gait in which two legs are moved at a time
; @param dir1 : Direction of motion
; @param dir2 : Direction of motion
; @param steps : number of steps
; */
; void two_leg_gait(unsigned char dir1, unsigned char dir2, int steps) {
	.dbline 237
; 	 unsigned char legs_anticlock[] = {0,2,3,6,1,4,5};
	ldi R24,<L14
	ldi R25,>L14
	movw R30,R28
	adiw R30,1
	ldi R16,7
	ldi R17,0
	st -y,R31
	st -y,R30
	st -y,R25
	st -y,R24
	xcall asgncblkx
	.dbline 238
; 	 unsigned char legs_clock[] = {0,4,1,2,5,6,3}; 
	ldi R24,<L15
	ldi R25,>L15
	movw R30,R28
	adiw R30,8
	ldi R16,7
	ldi R17,0
	st -y,R31
	st -y,R30
	st -y,R25
	st -y,R24
	xcall asgncblkx
	.dbline 239
; 	 unsigned char dir3 = legs_anticlock[dir2];
	movw R24,R28
	adiw R24,1
	ldd R30,y+31
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	std y+15,R2
	.dbline 240
; 	 unsigned char dir4 = legs_clock[dir1];
	movw R24,R28
	adiw R24,8
	ldd R30,y+29
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	std y+16,R2
	.dbline 241
; 	 unsigned char dir5 = legs_clock[dir4];
	movw R24,R28
	adiw R24,8
	mov R30,R2
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	std y+17,R2
	.dbline 242
; 	 unsigned char dir6= legs_anticlock[dir3];
	movw R24,R28
	adiw R24,1
	ldd R30,y+15
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	std y+18,R2
	.dbline 243
; 	 unsigned char step_forward = 50;
	ldi R20,50
	.dbline 244
; 	 unsigned char step_side = 40;
	ldi R24,40
	mov R12,R24
	.dbline 245
; 	 unsigned char lift = 40;
	ldi R22,40
	.dbline 246
; 	 int delay_time1 = FIVE_HUNDRED_MSEC;
	ldi R24,200
	ldi R25,0
	movw R14,R24
	.dbline 247
; 	 int delay_time2 = FIVE_HUNDRED_MSEC;
	movw R10,R24
	xjmp L17
L16:
	.dbline 249
; 	 
; 	 while(steps-- > 0) {
	.dbline 252
; 	 
; 	    //putting down legs 5 & 6
; 		angle(dir5, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+17
	xcall _angle
	.dbline 253
; 		angle(dir6, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+18
	xcall _angle
	.dbline 256
; 	 
; 	 	//picking up 1 & 2 legs
; 		angle(dir1, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+29
	xcall _angle
	.dbline 257
; 		angle(dir2, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+31
	xcall _angle
	.dbline 260
; 		
; 		//delay
; 		delay(delay_time1);
	movw R16,R14
	xcall _delay
	.dbline 263
; 		
; 		//moving body on legs 5 & 6
; 		angle(dir5, MOTOR_A, 90 - step_forward);
	ldi R24,90
	sub R24,R20
	std y+0,R24
	ldi R18,65
	ldd R16,y+17
	xcall _angle
	.dbline 264
; 		angle(dir6, MOTOR_A, 90 + step_forward);
	mov R24,R20
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+18
	xcall _angle
	.dbline 267
; 		
; 		//moving 1 & 2 legs in air 
; 		angle(dir1, MOTOR_A, 90 + step_forward);
	mov R24,R20
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+29
	xcall _angle
	.dbline 268
; 		angle(dir2, MOTOR_A, 90 - step_forward);
	ldi R24,90
	sub R24,R20
	std y+0,R24
	ldi R18,65
	ldd R16,y+31
	xcall _angle
	.dbline 271
; 		
; 		//delay
; 		delay(delay_time1);
	movw R16,R14
	xcall _delay
	.dbline 274
; 		
; 		//putting 1 & 2 legs down
; 		angle(dir1, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+29
	xcall _angle
	.dbline 275
; 		angle(dir2, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+31
	xcall _angle
	.dbline 278
; 		
; 		//picking up 3 & 4 legs		   
; 	 	angle(dir3, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+15
	xcall _angle
	.dbline 279
; 		angle(dir4, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+16
	xcall _angle
	.dbline 281
; 		
; 		delay(delay_time1);
	movw R16,R14
	xcall _delay
	.dbline 284
; 		
; 		//moving body on legs 1 & 2
; 		angle(dir1, MOTOR_A, 90 - step_forward);
	ldi R24,90
	sub R24,R20
	std y+0,R24
	ldi R18,65
	ldd R16,y+29
	xcall _angle
	.dbline 285
; 		angle(dir2, MOTOR_A, 90 + step_forward);
	mov R24,R20
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+31
	xcall _angle
	.dbline 288
; 		
; 		//moving legs 3 & 4 in air
; 		angle(dir3, MOTOR_A, 90 - step_side);
	ldi R24,90
	sub R24,R12
	std y+0,R24
	ldi R18,65
	ldd R16,y+15
	xcall _angle
	.dbline 289
; 		angle(dir4, MOTOR_A, 90 + step_side);
	mov R24,R12
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+16
	xcall _angle
	.dbline 291
; 		
; 		delay(delay_time2);
	movw R16,R10
	xcall _delay
	.dbline 294
; 		
; 		//putting down legs 3 & 4
; 		angle(dir3, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+15
	xcall _angle
	.dbline 295
; 		angle(dir4, MOTOR_B, 90);
	ldi R24,90
	std y+0,R24
	ldi R18,66
	ldd R16,y+16
	xcall _angle
	.dbline 298
; 		
; 		//picking up legs 5 & 6
; 		angle(dir5, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+17
	xcall _angle
	.dbline 299
; 		angle(dir6, MOTOR_B, lift);
	std y+0,R22
	ldi R18,66
	ldd R16,y+18
	xcall _angle
	.dbline 301
; 		
; 		delay(delay_time1);
	movw R16,R14
	xcall _delay
	.dbline 304
; 		
; 		//moving body on legs 3 & 4
; 		angle(dir3, MOTOR_A, 90 + step_side);
	mov R24,R12
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+15
	xcall _angle
	.dbline 305
; 		angle(dir4, MOTOR_A, 90 - step_side);
	ldi R24,90
	sub R24,R12
	std y+0,R24
	ldi R18,65
	ldd R16,y+16
	xcall _angle
	.dbline 308
; 		
; 		//moving legs 5 & 6 in air 
; 		angle(dir5, MOTOR_A, 90 + step_forward);
	mov R24,R20
	subi R24,166    ; addi 90
	std y+0,R24
	ldi R18,65
	ldd R16,y+17
	xcall _angle
	.dbline 309
; 		angle(dir6, MOTOR_A, 90 - step_forward);
	ldi R24,90
	sub R24,R20
	std y+0,R24
	ldi R18,65
	ldd R16,y+18
	xcall _angle
	.dbline 311
; 		
; 		delay(delay_time2);
	movw R16,R10
	xcall _delay
	.dbline 313
; 				   
; 	 }
L17:
	.dbline 249
	ldd R4,y+33
	ldd R5,y+34
	movw R24,R4
	sbiw R24,1
	std y+34,R25
	std y+33,R24
	clr R2
	clr R3
	cp R2,R4
	cpc R3,R5
	brge X9
	xjmp L16
X9:
X8:
	.dbline -2
L13:
	.dbline 0 ; func end
	adiw R28,19
	xcall pop_xgsetF0FC
	adiw R28,4
	ret
	.dbsym l legs_clock 8 A[7:7]c
	.dbsym l legs_anticlock 1 A[7:7]c
	.dbsym r delay_time2 10 I
	.dbsym r delay_time1 14 I
	.dbsym r step_side 12 c
	.dbsym l dir6 18 c
	.dbsym l dir5 17 c
	.dbsym l dir4 16 c
	.dbsym l dir3 15 c
	.dbsym r lift 22 c
	.dbsym r step_forward 20 c
	.dbsym l steps 33 I
	.dbsym l dir2 31 c
	.dbsym l dir1 29 c
	.dbend
; }
