/***
@author  Srijit Dutt
Date Sun 07 Nov 2010 02:42:38 PM IST 

ICCAVR

hexapod_motions.c : File contains various advanced motion functions for the hexapod
Please include hexapod_motions.h file to call function from this file

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
#include "hexapod_basic.h"
#include "hexapod.h"


/**
The hexapod stands on 4 legs with two legs in the air
and moves its legs
@param dir1 : The first of the two legs to be in air 
@param dir2 : The second leg to be in air 
The legs should be consecutive
@param steps : The number of time the legs in the air are moved
*/
void pose(unsigned char dir1, unsigned char dir2, int steps) {
	 
	 unsigned char legs_anticlock[] = {0,2,3,6,1,4,5};
	 unsigned char legs_clock[] = {0,4,1,2,5,6,3}; 
	 unsigned char dir3 = legs_anticlock[dir2];
	 unsigned char dir4 = legs_clock[dir1];
	 unsigned char dir5 = legs_clock[dir4];
	 unsigned char dir6= legs_anticlock[dir3];
	 
	 unsigned char lift = 40;
	 unsigned char step_side = 50;
	 unsigned char spread_out = 60;
	 int delay_time = FIVE_HUNDRED_MSEC;
	 int i;
	 
	 //lifting legs 3 & 4
	 angle(dir3, MOTOR_B, lift);
	 angle(dir4, MOTOR_B, lift);
	 
	 delay(delay_time);
	 
	 //moving legs 3 & 4 forward
	 angle(dir3, MOTOR_A, 90 - step_side);
	 angle(dir4, MOTOR_A, 90 + step_side);
	 angle(dir3, MOTOR_C, 90 + 70);
	 angle(dir4, MOTOR_C, 90 + 70);

	 
	 //spreading legs 5 & 6 out
	 angle(dir5, MOTOR_C, 90 + spread_out);
	 angle(dir6, MOTOR_C, 90 + spread_out);
	 
	 delay(delay_time);
	 
	 
	 //putting down legs 3 & 4
	 angle(dir3, MOTOR_B, 180);
	 angle(dir4, MOTOR_B, 180);

	 delay(delay_time);
	 
	 //lifting legs 1 & 2
	 angle(dir1, MOTOR_B, 0);
	 angle(dir2, MOTOR_B, 0);
	 
	 //aligning legs 1 & 2
	 angle(dir1, MOTOR_A, 150);
	 angle(dir2, MOTOR_A, 30);
	 
	 
	 //shaking legs 1 & 2 in air
	 for(i = 0; i < steps; i++) {
	 	   angle(dir1, MOTOR_B, 30);
		   angle(dir2, MOTOR_B, 30);
		   
		   delay(delay_time);
		   
		   angle(dir1, MOTOR_B, 0);
	 	   angle(dir2, MOTOR_B, 0);
		   
		   delay(delay_time);
	 }
	 
	 //resetting to original position
	 //servo_calibration();
}


/**
The hexapod moves its weight from legs dir1, dir2 to legs opposite to dir1, dir2 
steps : The nummber of steps in the dance move
@param dir1 : Direction of motion
@param dir2 : Direction of motion
@param steps : number of steps
*/
void dance(unsigned char dir1, unsigned char dir2, int steps) {
	 int array_opposite[] = {0,6,5,4,3,2,1};
	 unsigned char dir1_opposite = array_opposite[dir1];
	 unsigned char dir2_opposite = array_opposite[dir2];
	 unsigned char stretch = 90;
	 int delay_time = FIVE_HUNDRED_MSEC;
	 
	 while(steps-- > 0) {
	 			   
	 	//move towards 6 & 5
		angle(dir1, MOTOR_B, 90 + stretch);
	 	angle(dir1, MOTOR_C, 90 + 90);
	 	angle(dir1_opposite, MOTOR_B, 90 - stretch); 
	 	angle(dir1_opposite, MOTOR_C, 90 - stretch);	 
	 	angle(dir2, MOTOR_B, 90 + stretch);
	 	angle(dir2, MOTOR_C, 90 + 90);
	 	angle(dir2_opposite, MOTOR_B, 90 - stretch); 
	 	angle(dir2_opposite, MOTOR_C, 90 - stretch);
		
		//delay
		delay(delay_time);
		
		
		//move towards 1 & 2
		angle(dir1_opposite, MOTOR_B, 90 + stretch);
	 	angle(dir1_opposite, MOTOR_C, 90 + 90);
	 	angle(dir1, MOTOR_B, 90 - stretch); 
	 	angle(dir1, MOTOR_C, 90 - stretch);	 
	 	angle(dir2_opposite, MOTOR_B, 90 + stretch);
	 	angle(dir2_opposite, MOTOR_C, 90 + 90);
	 	angle(dir2, MOTOR_B, 90 - stretch); 
	 	angle(dir2, MOTOR_C, 90 - stretch);
		
		
		//delay
		delay(delay_time);
	}	
}

/**
Servo control the hexapod shifts its weight clockwise
@param steps : number of steps to be carried out
@param movement : clockwise or anticlockwise
*/
void sway(int steps, unsigned char movement) {
	 int array_opposite[] = {0,6,5,4,3,2,1};
	 unsigned char legs_anticlock[] = {0,2,3,6,1,4,5};
	 unsigned char legs_clock[] = {0,4,1,2,5,6,3};
	 unsigned char dir1 = LEG_1;
	 unsigned char dir2  = LEG_2;
	 unsigned char dir_centre = LEG_3;
	 unsigned char dir_centre_opposite  = LEG_4;
	 unsigned char dir1_opposite = array_opposite[dir1];
	 unsigned char dir2_opposite = array_opposite[dir2];
	 unsigned char stretch = 90;
	 int delay_time = TWO_HUNDRED_FIFTY_MSEC;
	 
	 while(steps-- > 0) {
	 			   
	 	//move towards 6 & 5 opposite legs
		angle(dir1, MOTOR_B, 90 + stretch);
	 	angle(dir1, MOTOR_C, 90 + 90);
	 	angle(dir1_opposite, MOTOR_B, 90 - stretch); 
	 	angle(dir1_opposite, MOTOR_C, 90 - stretch);	 
	 	angle(dir2, MOTOR_B, 90 + stretch);
	 	angle(dir2, MOTOR_C, 90 + 90);
	 	angle(dir2_opposite, MOTOR_B, 90 - stretch); 
	 	angle(dir2_opposite, MOTOR_C, 90 - stretch);
		
		//reset leg 3 & 4 centre legs
		angle(dir_centre, MOTOR_B, 90);
		angle(dir_centre_opposite, MOTOR_B, 90);	
		angle(dir_centre, MOTOR_C, 90);
		angle(dir_centre_opposite, MOTOR_C, 90);
		
		//delay
		delay(delay_time);
		
		//update legs
		if(movement == CLOCK_WISE) {
			dir1 = legs_clock[dir1];
			dir2 = legs_clock[dir2];
			dir1_opposite = legs_clock[dir1_opposite];
			dir2_opposite = legs_clock[dir2_opposite];
			dir_centre = legs_clock[dir_centre];
			dir_centre_opposite = legs_clock[dir_centre_opposite];
		} else {
			dir1 = legs_anticlock[dir1];
			dir2 = legs_anticlock[dir2];
			dir1_opposite = legs_anticlock[dir1_opposite];
			dir2_opposite = legs_anticlock[dir2_opposite];
			dir_centre = legs_anticlock[dir_centre];
			dir_centre_opposite = legs_anticlock[dir_centre_opposite];
		}
	}	
}

/**
Used to make the hexapod climb steps
*/
void climb() {
	 unsigned char lift = 50;
	 int delay_time1  =  FIVE_HUNDRED_MSEC;
	 int delay_time2 = ONE_SEC;
	 
	 setMirrorDir(DIR_MIRROR_LEG_1_2);
	 
	 /* ---increase bot height --- */
	 angleMirror(LEG_1, MOTOR_B, 180);
	 angleMirror(LEG_1, MOTOR_C, 180);
	 
	 angleMirror(LEG_4, MOTOR_B, 180);
	 angleMirror(LEG_4, MOTOR_C, 180);
	 
	 angleMirror(LEG_5, MOTOR_B, 180);
	 angleMirror(LEG_5, MOTOR_C, 180);
	 
	 delay(delay_time1);
	 
	 
	 /* ---- Thrust the body of the robot forward ----*/
	 
	 //pick up leg 3 & 4
	 angleMirror(LEG_4, MOTOR_B, 90);
	 	 
	 delay(delay_time1);
		
		
	 //Leg 3 moves more than leg 4 bot goes towards left 	 
	 //move leg 3 & 4 in air
	 //angleMirror(LEG_4, MOTOR_A, 180);
	 angle(LEG_4, MOTOR_A, 180);
	 angle(LEG_3, MOTOR_A, 20);
	 
	 delay(delay_time2);
	 	 
	 //put leg 3 & 4 down
	 angleMirror(LEG_4, MOTOR_B, 180);
	 
	 delay(delay_time1);
	 
	 //move legs 1 & 2	 
	 angleMirror(LEG_1, MOTOR_A, 30);

	 delay(delay_time1);
	 
	 //pick up leg 1 & 2
	 angleMirror(LEG_1, MOTOR_B, 0);
	 angleMirror(LEG_1, MOTOR_C, 180);
	 
	 delay(delay_time2);
	 
	 //move legs 1 & 2 in air
	 angleMirror(LEG_1, MOTOR_A, 150);
	 
	 delay(delay_time1);
	 
	 /*---- Bot pushes itself on the platform -- */
	 
	 //move body on leg 3 & 4
	 angleMirror(LEG_4, MOTOR_A, 0);
	 
	 delay(ONE_SEC);
	 
	 // move leg 1 & 2
	 angleMirror(LEG_1, MOTOR_B, 50); //tune for height
	 angleMirror(LEG_1, MOTOR_C, 90); //tune this too
	 
	 delay(delay_time1);
	 
	 //pick up 3&4
	 angleMirror(LEG_4, MOTOR_B, 0);
	 angleMirror(LEG_4, MOTOR_C, 180);
	 
	 delay(delay_time1);
	 
	 //moving leg 3&4 in air
	 angleMirror(LEG_4, MOTOR_A, 180);
	 
	 delay(delay_time1);
	 
	 //make leg 3 &4 touch ground
	 angleMirror(LEG_4, MOTOR_B, 50);
	 angleMirror(LEG_4, MOTOR_C, 50);
	 
	 
	 delay(delay_time1);
	 
	 //move body on leg 3 & 4 
	 angleMirror(LEG_4, MOTOR_A, 0);
	 angleMirror(LEG_1, MOTOR_C, 0);
	 	 	 
	 delay(delay_time2);
	 
	 angleMirror(LEG_1, MOTOR_C, 90);
	 angleMirror(LEG_1, MOTOR_B, 90);
	 
	 delay(delay_time1);
	 
	 
	 //drag body forward on legs 1 & 2 
	 angleMirror(LEG_1, MOTOR_A, 0);
	 
	 delay(delay_time2);
	
	
	 //pick up 3 & 4
	 angleMirror(LEG_4, MOTOR_B, 0);
	 angleMirror(LEG_4, MOTOR_C, 0);
	
	
	 delay(delay_time1);
	
	 //move forward in air 
	 angleMirror(LEG_4, MOTOR_A, 180);
	
	 delay(delay_time1);
	
	//put 3 & 4 down
	angleMirror(LEG_4, MOTOR_B, 50);
	angleMirror(LEG_4, MOTOR_C, 50);
	
	delay(delay_time1);
	
	//push body on 3 & 4
	angleMirror(LEG_4, MOTOR_A, 0);
	
	delay(delay_time2);
	
	// make this more smooth
	//make hexapod sit
	angleMirror(LEG_4, MOTOR_B, 0);
	angleMirror(LEG_4, MOTOR_C, 180);
	delay(delay_time1);
	
	angleMirror(LEG_1, MOTOR_B, 0);
	
	delay(delay_time1);	
	
	angleMirror(LEG_4, MOTOR_A, 90);
	 
	delay(delay_time1);
	 
	//pick up legs 5 & 6
	angleMirror(LEG_5, MOTOR_B, 0);
	angleMirror(LEG_5, MOTOR_C, 180);
	 
	delay(delay_time1);
	 
	//move legs 5 & 6 in air 
	angleMirror(LEG_5, MOTOR_A, 180);
	 
	delay(delay_time1);
	 
	//crawl on 1, 2 , 3 ,4
	angleMirror(LEG_1, MOTOR_A, 180);
	angleMirror(LEG_4, MOTOR_A, 180);
	 
	delay(delay_time2);
	 
	//put down 1, 2, 3, 4
	angleMirror(LEG_1, MOTOR_B, 50);
	angleMirror(LEG_1, MOTOR_C, 50);
	angleMirror(LEG_4, MOTOR_B, 50);
	angleMirror(LEG_4, MOTOR_C, 50);
	 
	delay(delay_time1);
	 
	//crawl on 1, 2 , 3 ,4
	angleMirror(LEG_1, MOTOR_A, 0);
	angleMirror(LEG_4, MOTOR_A, 0);
	
	delay(delay_time2);
	 
	 
	//put down 5 & 6 
	angleMirror(LEG_5, MOTOR_B, 50);
	angleMirror(LEG_5, MOTOR_C, 50);
	 
	delay(delay_time1);
	 
	//stand up and dance
	 
	angleMirror(LEG_1, MOTOR_B, 90);
	angleMirror(LEG_1, MOTOR_C, 90);
	angleMirror(LEG_4, MOTOR_B, 90);
	angleMirror(LEG_4, MOTOR_C, 90);
	angleMirror(LEG_5, MOTOR_B, 90);
	angleMirror(LEG_5, MOTOR_C, 90);
	 
	delay(delay_time1);
	 
	angleMirror(LEG_5, MOTOR_A, 90);
	 
	delay(ONE_SEC);
	 
	servo_calibration(); //must be called as the first instruction
	 
	delay(ONE_SEC);
	 
	 	 
}

/**
The hexapod moves on four legs
This method doesnt work as planned
*/
void walk_on_four() {
	 
	 unsigned char lift = 120;
	 unsigned char delay_time  = HUNDRED_MSEC;
	 int i = 10;
	 //come to pose
	 pose(1,2,0);
	 
	 delay(ONE_SEC);
	 delay(ONE_SEC);
	 
	 
	 while(i-- > 0) {
	 
	 //adjust body weight
	 //angle(LEG_6, MOTOR_A, 90 - 50);	
	 //angle(LEG_5, MOTOR_A, 90 + 50);
	 
	 //delay(ONE_SEC);
	 
	 angle(LEG_3, MOTOR_B, lift);
	 angle(LEG_4, MOTOR_B, 180);
	 
	 delay(delay_time);
	 
	 //move left forward leg forward in air
	 angle(LEG_3, MOTOR_A, 70);
	 angle(LEG_4, MOTOR_A, 90);
	 
	 delay(delay_time);
	 
	 angle(LEG_3, MOTOR_B, 180);
	 angle(LEG_4, MOTOR_B, lift);
	 
	 delay(delay_time);
	 
	 angle(LEG_3, MOTOR_A, 90);
	 angle(LEG_4, MOTOR_A, 70);
	 	 
	 delay(delay_time);
	 
	 
	 }
	 //move right backward leg forward in air
	 //angle(LEG_5, MOTOR_A, 90 + 50);
	 
	 
	 //delay
	 //delay(delay_time);
	 
	 //move right forward leg forward in air
	 //angle(LEG_4, MOTOR_A, 90 + 50);
	 
	 //delay(delay_time);
	 
	 //move left backward forward in air
	 //angle(LEG_6, MOTOR_A, 90 - 50);

	 //delay(delay_time);
}
