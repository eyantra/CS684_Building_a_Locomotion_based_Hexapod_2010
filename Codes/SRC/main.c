/**
@mainpage Building a locamotion based Hexapod Application
@author Group 6 Srijit Dutt 10305056

Mon 08 Nov 2010 12:49:10 AM IST 

ICC AVR 7

Conatins various functions for basic, advanced hexapod motions


*/

/*********************************************************************************

   Copyright (c) 2010, ERTS Lab IIT Bombay erts@cse.iitb.ac.in               -*- c -*-
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.

   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in
     the documentation and/or other materials provided with the
     distribution.

   * Neither the name of the copyright holders nor the names of
     contributors may be used to endorse or promote products derived
     from this software without specific prior written permission.

   * Source code can be used for academic purpose. 
	 For commercial use permission form the author needs to be taken.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE. 

  Software released under Creative Commence cc by-nc-sa licence.
  For legal information refer to: 
  http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode

********************************************************************************/


#include <iom2560v.h>
#include <macros.h>
#include "hexapod_macro.h"
#include "hexapod.h"
#include "hexapod_basic.h"
#include "hexapod_motions.h"
#include "gait.h"
#include "keyboard.h"

extern unsigned char data;



/**
The main function used to call other functions
*/
void main(void) {

	int i = 100;
	init_devices();
	//insert your functional code here...
	servo_calibration(); //must be called as the first instruction
	servo_on();//turning on the servo supply
	initializeAngles();
	delay(ONE_SEC);
	delay(ONE_SEC);
	delay(ONE_SEC);

	//angle_XA(0);
	//angle_XB(0);
	//angle_XC(0);
	//delay_1s();
	//delay_1s();
	//angle_XA(180);
	//angle_XB(180);
	//angle_XC(180);

	//angle(1, MOTOR_B, 40);
	//angle(3, MOTOR_B, 40);
	//angle(5, MOTOR_B, 40);
	//angle(LEG_2, MOTOR_A, 0);
	//angle(4, MOTOR_B, 0);
	//angle(6, MOTOR_B, 0);
		
	//tripod_gait(1, 10);
	//tripod_gait(2, 10);
	//tripod_gait(3, 10);
	//tripod_gait(4, 10);
	//tripod_gait(5, 10);
	//tripod_gait(6, 10);
	
	//two_leg_gait(1, 2, 10);
	//two_leg_gait(2, 3, 10);
	//two_leg_gait(3, 6, 10);
	//two_leg_gait(6, 5, 10);
	//two_leg_gait(5, 4, 10);
	//two_leg_gait(4, 1, 10);
	
	
	
	//robot_rotate_clockwise_7_5();
	
	
	/*
	dance(1,2,10);
	
	
	delay(ONE_SEC);
	servo_calibration();
	
	pose(1, 2, 10);
	*/
		
	//delay(ONE_SEC);
	//servo_calibration();
	
	//dance(4,5,10);
	
	//delay(ONE_SEC);
	
	//sway(24, CLOCK_WISE);
	
	//climb();
	
	
	
	//tripod_gait_2(LEG_1, 30);
	
	//delay(ONE_SEC);
	
	//walk_on_four();
	
	//servo_calibration();
	
	
	//setMirrorDir(DIR_MIRROR_LEG_1_2);
	//angleMirror(LEG_1, MOTOR_A, 0);
	//angleMirror(LEG_4, MOTOR_A, 0);
	//angleMirror(LEG_5, MOTOR_A, 0);
	
	//delay(ONE_SEC);
	
	//angleMirror(LEG_1, MOTOR_A, 180);
	//angleMirror(LEG_4, MOTOR_A, 180);
	//angleMirror(LEG_5, MOTOR_A, 180);

	/*
	angleMirror(LEG_1, MOTOR_B, 0);
	angleMirror(LEG_4, MOTOR_B, 0);
	angleMirror(LEG_5, MOTOR_B, 0);
	
	delay(ONE_SEC);
	
	angleMirror(LEG_1, MOTOR_B, 180);
	angleMirror(LEG_4, MOTOR_B, 180);
	angleMirror(LEG_5, MOTOR_B, 180);
	*/
	
	/*
	angleMirror(LEG_1, MOTOR_C, 0);
	angleMirror(LEG_4, MOTOR_C, 0);
	angleMirror(LEG_5, MOTOR_C, 0);
		
	delay(ONE_SEC);
	
	angleMirror(LEG_1, MOTOR_C, 180);
	angleMirror(LEG_4, MOTOR_C, 180);
	angleMirror(LEG_5, MOTOR_C, 180);
	*/
	
	/* Testing Remaining
	angleMirrorChange(LEG_1, MOTOR_C, 90);
	angleMirrorChange(LEG_4, MOTOR_C, 90);
	angleMirrorChange(LEG_5, MOTOR_C, 90);
	*/
	
	
	/*
	while(1) {
		keyboard_control();
		delay(TWO_HUNDRED_FIFTY_MSEC);	 
	}
	*/
	 
	/*
	tripod_gait(LEG_1, 6);
	
	//two_leg_gait(LEG_1, LEG_2, 6);
	
	delay(ONE_SEC);
	
	robot_rotate_clockwise_7_5();
	
	delay(HUNDRED_MSEC);
	
	robot_rotate_clockwise_7_5();
	
	delay(HUNDRED_MSEC);
	
	robot_rotate_clockwise_7_5();
	
	delay(HUNDRED_MSEC);
	
	
	tripod_gait(LEG_2, 2);
	
	*/
	
	delay(ONE_SEC);
	
	//servo_calibration();
	
	delay(ONE_SEC);
		
	climb();
	
	//delay(ONE_SEC);
	delay(ONE_SEC);
	
	/*
	buzzer_on();
	delay(ONE_SEC);
	buzzer_off();
	
	
	i = 100;
	while(i-- > 0) {
		keyboard_control();
		delay(TWO_HUNDRED_FIFTY_MSEC);	 
	}
	*/
	
	
	tripod_gait(LEG_2, 2);
	
	delay(ONE_SEC);
	
	dance(4,5,6);
	
	delay(ONE_SEC);
	
	servo_calibration();
	
	delay(ONE_SEC);
		
	sway(24, CLOCK_WISE);
	
	delay(ONE_SEC);
	
	servo_calibration();
	
	delay(ONE_SEC);
	
	pose(3, 6, 10);
	
	delay(ONE_SEC);
	
	servo_calibration();
	
	delay(ONE_SEC);
	
	dance(4,5,6);
	
	delay(ONE_SEC);
	
	sway(24, ANTI_CLOCK_WISE);
	
	
	
	 
}


