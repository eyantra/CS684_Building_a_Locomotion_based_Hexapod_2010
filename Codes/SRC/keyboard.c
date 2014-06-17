/***
Author : Srijit Dutt
Date Sun 07 Nov 2010 02:42:38 PM IST 

keyboard.c : File contains various advanced motion functions for the hexapod
Please include keyboard.h file to call function from this file

The various functions are : 
keyboard_control
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




#include "hexapod_macro.h"
#include "hexapod.h"
#include "gait.h"
#include "hexapod_motions.h"
#include "hexapod_basic.h"


extern unsigned char data;//!< The keyborad command given by user


/**
Controls hexapod through keyboard using ZigBee communication
*/
void keyboard_control(void) {
	
	static char change = 15;
	
	switch(data) {
	   case 's':
	   		servo_calibration();
	   		break;
	   case 'w': 
	         tripod_gait(LEG_2, 1);
			 break;	
	   case 'e': 
	         tripod_gait(LEG_1, 1);
			 break;
	   case 'd': 
	         tripod_gait(LEG_4, 1);
			 break;
	   case 'x': 
	         tripod_gait(LEG_5, 1);
			 break;
	   case 'z': 
	         tripod_gait(LEG_6, 1);
			 break;
	   case 'a': 
	         tripod_gait(LEG_3, 1);
			 break;	 	
	   case 't': 
			two_leg_gait(1, 2, 1);
			break;
	   case 'b':
	   		buzzer_on_off();
			break;
	   case 'p':
	   		pose(LEG_1, LEG_2, 10);
			break;
	   case 'k':
	        sway(24, CLOCK_WISE);
	        break;
	   case 'l':
	        dance(4,5,6);
	        break;				
	   case 'c' :
	        climb();
			break;
	   case '>' :
		    robot_rotate_clockwise_7_5();
			break;	
	   case '<' :
		    robot_rotate_anticlockwise_7_5();
			break;		
			
	   /*case '+':
	        angle_change(LEG_1, MOTOR_A, change);
			break;
	   case '-':
	        angle_change(LEG_1, MOTOR_A, -change);
			break;	
	   case '*':
	        change += 5;
			if(change > 90)
			    change = 90;
			break;
	   case '/':
	        change += -5;
			if(change < 5)
			   change = 5;
			break;*/
			
			
		/*	
	   case '`':
	        angle_change(LEG_1, MOTOR_A, change);
			break;
	   case '~':
	        angle_change(LEG_1, MOTOR_A, -change);
			break;
	   case '1':
	        angle_change(LEG_1, MOTOR_B, change);
			break;
	   case '!':
	        angle_change(LEG_1, MOTOR_B, -change);
			break;
		case '2':
	        angle_change(LEG_1, MOTOR_C, change);
			break;
	   case '@':
	        angle_change(LEG_1, MOTOR_C, -change);
			break;
			
		case '3':
	        angle_change(LEG_2, MOTOR_A, change);
			break;
	   case '#':
	        angle_change(LEG_2, MOTOR_A, -change);
			break;
	   case '4':
	        angle_change(LEG_2, MOTOR_B, change);
			break;
	   case '$':
	        angle_change(LEG_2, MOTOR_B, -change);
			break;
		case '5':
	        angle_change(LEG_2, MOTOR_C, change);
			break;
	   case '%':
	        angle_change(LEG_2, MOTOR_C, -change);
			break;
		
		case '6':
	        angle_change(LEG_3, MOTOR_A, change);
			break;
	   case '^':
	        angle_change(LEG_3, MOTOR_A, -change);
			break;
	   case '7':
	        angle_change(LEG_3, MOTOR_B, change);
			break;
	   case '&':
	        angle_change(LEG_3, MOTOR_B, -change);
			break;
		case '8':
	        angle_change(LEG_3, MOTOR_C, change);
			break;
	   case '*':
	        angle_change(LEG_3, MOTOR_C, -change);
			break;
		
		case '9':
	        angle_change(LEG_4, MOTOR_A, change);
			break;
	   case '(':
	        angle_change(LEG_4, MOTOR_A, -change);
			break;
	   case '0':
	        angle_change(LEG_4, MOTOR_B, change);
			break;
	   case ')':
	        angle_change(LEG_4, MOTOR_B, -change);
			break;
		case '-':
	        angle_change(LEG_4, MOTOR_C, change);
			break;
	   case '_':
	        angle_change(LEG_4, MOTOR_C, -change);
			break;
		
		case '=':
	        angle_change(LEG_5, MOTOR_A, change);
			break;
	   case '+':
	        angle_change(LEG_5, MOTOR_A, -change);
			break;
	   case '[':
	        angle_change(LEG_5, MOTOR_B, change);
			break;
	   case '{':
	        angle_change(LEG_5, MOTOR_B, -change);
			break;
		case ']':
	        angle_change(LEG_5, MOTOR_C, change);
			break;
	   case '}':
	        angle_change(LEG_5, MOTOR_C, -change);
			break;
		
		case '\\':
	        angle_change(LEG_6, MOTOR_A, change);
			break;
	   case '|':
	        angle_change(LEG_6, MOTOR_A, -change);
			break;
	   case ';':
	        angle_change(LEG_6, MOTOR_B, change);
			break;
	   case ':':
	        angle_change(LEG_6, MOTOR_B, -change);
			break;
		case '\'':
	        angle_change(LEG_6, MOTOR_C, change);
			break;
	   case '\"':
	        angle_change(LEG_6, MOTOR_C, -change);
			break;
		*/		
		default :
		    buzzer_on();
			break;
	}	           
	 	
	data = '';
}
