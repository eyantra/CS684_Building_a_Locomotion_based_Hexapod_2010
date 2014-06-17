NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                       efunc_lit   00E4   004E =     78. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00E4  __efunc_lit_start
       0132  __efunc_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0132   006A =    106. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0132  __lit_start
       019C  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   019C   000E =     14. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       019C  __idata_start
       01AA  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   01AA   2666 =   9830. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00D5  __start
       00D5  __text_start
       00F7  _exit
       00F8  _main
       016B  _tripod_gait
       025D  _tripod_gait_2
       03C0  _two_leg_gait
       04BF  _port_init
       04E7  _timer1_init
       050E  _turn_on_sharp15
       0514  _turn_off_sharp15
       051A  _reset_1A
       051E  _set_1A
       0520  _reset_1B
       0526  _set_1B
       052C  _reset_1C
       0530  _set_1C
       0532  _reset_2A
       0538  _set_2A
       053E  _reset_2B
       0542  _set_2B
       0544  _reset_2C
       054A  _set_2C
       0550  _reset_3A
       0556  _set_3A
       055C  _reset_3B
       0562  _set_3B
       0568  _reset_3C
       056E  _set_3C
       0574  _reset_SP_RIGHT
       057A  _set_SP_RIGHT
       0580  _reset_4A
       0584  _set_4A
       0586  _reset_4B
       058A  _set_4B
       058C  _reset_4C
       0590  _set_4C
       0592  _reset_5A
       0598  _set_5A
       059E  _reset_5B
       05A4  _set_5B
       05AA  _reset_5C
       05B0  _set_5C
       05B6  _reset_6A
       05BC  _set_6A
       05C2  _reset_6B
       05C8  _set_6B
       05CE  _reset_6C
       05D4  _set_6C
       05DA  _timer1_compa_isr
       0625  _timer1_compb_isr
       0670  _timer1_compc_isr
       06BB  _timer1_ovf_isr
       07EE  _uart0_init
       07FF  _init_devices
       0826  _uart0_rx_isr
       085B  _servo_on
       085D  _servo_off
       0861  _reset_SP_LEFT
       0867  _set_SP_LEFT
       086D  _angle_value_calculation
       0887  _angle_1A
       0896  _angle_1B
       08AB  _angle_1C
       08C0  _angle_2A
       08CF  _angle_2B
       08E4  _angle_2C
       08F9  _angle_3A
       0908  _angle_3B
       091D  _angle_3C
       0932  _angle_4A
       0941  _angle_4B
       0956  _angle_4C
       096B  _angle_5A
       097A  _angle_5B
       098F  _angle_5C
       09A4  _angle_6A
       09B3  _angle_6B
       09C8  _angle_6C
       09DD  _servo_calibration
       0A02  _even_A_servo_90
       0A09  _even_A_servo_65
       0A10  _even_A_servo_115
       0A17  _even_BC_servo_90
       0A24  _even_BC_servo_up_45
       0A31  _even_BC_servo_down_45
       0A3E  _odd_A_servo_90
       0A45  _odd_A_servo_65
       0A4C  _odd_A_servo_115
       0A53  _odd_BC_servo_90
       0A60  _odd_BC_servo_up_45
       0A6D  _odd_BC_servo_down_45
       0A7A  _robot_rotate_clockwise_7_5
       0A99  _robot_rotate_anticlockwise_7_5
       0AB8  _forward
       0B1B  _back
       0B7E  _robot_standup
       0BA4  _buzzer_on
       0BA6  _buzzer_off
       0BAA  _delay
       0BB8  _ADC_Conversion
       0BDA  _initializeAngles
       0BFD  _angle
       0CB0  _angle_XA
       0CC6  _angle_XB
       0CE8  _angle_XC
       0D0A  _swap
       0D15  _setAngle
       0D25  _getAngle
       0D34  _buzzer_on_off
       0D4E  _angle_change
       0D7D  _setMirrorDir
       0D80  _getMirrorDir
       0D83  _getMirrorArm
       0DA3  _angleMirror
       0DC4  _angleMirrorChange
       0DD8  _pose
       0EA7  _dance
       0F52  _sway
       105C  _climb
       128F  _walk_on_four
       12F2  _keyboard_control
       1379  push_arg4
       137B  push_arg2
       137E  mod8u
       1380  div8u
       1381  xdiv8u
       1396  empy16s
       13A6  pop_xgset30FC
       13AF  pop_xgsetF0FC
       13BA  push_xgsetF0FC
       13BC  push_xgset30FC
       13BE  push_xgset00FC
       13C0  push_xgset003C
       13C5  push_xgsetF000
       13CA  pop_xgsetF000
       13CF  push_xgsetF00C
       13D6  pop_xgsetF00C
       13DD  push_xgsetF03C
       13E6  pop_xgsetF03C
       13EF  asgncblkx
       1408  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0200   000E =     14. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0200  _arm_number
       0200  __data_start
       0201  _angle_upper_byte
       0202  _angle_lower_byte
       0203  _degree
       0204  _delay_count
       0206  _serial_communication_interval
       0208  _serial_communication_channel_number
       0209  _motion_busy
       020A  hexapod_basic.c:dirMirror
       020B  hexapod_basic.c:flag
       020D  keyboard.c:change
       020E  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   020E   0057 =     87. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       020E  __bss_start
       020E  _data
       020F  _remote_data
       0217  _angle_lower_byte_6C
       0219  _angle_upper_byte_6C
       021B  _angle_lower_byte_6B
       021D  _angle_upper_byte_6B
       021F  _angle_lower_byte_6A
       0220  _angle_upper_byte_6A
       0221  _angle_lower_byte_5C
       0223  _angle_upper_byte_5C
       0225  _angle_lower_byte_5B
       0227  _angle_upper_byte_5B
       0229  _angle_lower_byte_5A
       022A  _angle_upper_byte_5A
       022B  _angle_lower_byte_4C
       022D  _angle_upper_byte_4C
       022F  _angle_lower_byte_4B
       0231  _angle_upper_byte_4B
       0233  _angle_lower_byte_4A
       0234  _angle_upper_byte_4A
       0235  _angle_lower_byte_3C
       0237  _angle_upper_byte_3C
       0239  _angle_lower_byte_3B
       023B  _angle_upper_byte_3B
       023D  _angle_lower_byte_3A
       023E  _angle_upper_byte_3A
       023F  _angle_lower_byte_2C
       0241  _angle_upper_byte_2C
       0243  _angle_lower_byte_2B
       0245  _angle_upper_byte_2B
       0247  _angle_lower_byte_2A
       0248  _angle_upper_byte_2A
       0249  _angle_lower_byte_1C
       024B  _angle_upper_byte_1C
       024D  _angle_lower_byte_1B
       024F  _angle_upper_byte_1B
       0251  _angle_lower_byte_1A
       0252  _angle_upper_byte_1A
       0253  _angleArr
       0265  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0068 =    104. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\PROGRA~1\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
main.o	[ main.c ]
gait.o	[ gait.c ]
hexapod.o	[ hexapod.c ]
hexapod_basic.o	[ hexapod_basic.c ]
hexapod_motions.o	[ hexapod_motions.c ]
keyboard.o	[ keyboard.c ]
<library>	[ asave.s, div8u.s, emul16s.s, gpop4.s, gpop5.s, gpush.s, gpushy.s, gpushz.s, gpushb.s, pmstructx.s ]

User Global Definitions

ram_end = 0x21ff
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0xe4
data = 0x200
eeprom:0.4096

