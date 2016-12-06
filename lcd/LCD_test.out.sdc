## Generated SDC file "LCD_test.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Full Version"

## DATE    "Thu Dec 01 02:36:44 2016"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

#**************************************************************
# Set False Path
#**************************************************************

#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

#set_max_delay -from [get_ports {LCD_DATA[0] LCD_DATA[1] LCD_DATA[2] LCD_DATA[3] LCD_DATA[4] LCD_DATA[5] LCD_DATA[6] LCD_DATA[7] LCD_EN LCD_ON LCD_RS LCD_RW  clk reset}] 3.000
#set_max_delay -to [get_ports {LCD_DATA[1] LCD_DATA[0] LCD_DATA[2] LCD_DATA[3] LCD_DATA[4] LCD_DATA[5] LCD_DATA[6] LCD_DATA[7] LCD_EN LCD_ON LCD_RS LCD_RW}] 3.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

#set_min_delay -from [get_ports {LCD_DATA[0] LCD_DATA[1] LCD_DATA[2] LCD_DATA[3] LCD_DATA[4] LCD_DATA[5] LCD_DATA[6] LCD_DATA[7] LCD_EN LCD_ON LCD_RS LCD_RW}] 2.000
#set_min_delay -to [get_ports {LCD_DATA[0] LCD_DATA[1] LCD_DATA[2] LCD_DATA[3] LCD_DATA[4] LCD_DATA[5] LCD_DATA[6] LCD_DATA[7] LCD_EN LCD_ON LCD_RS LCD_RW}] 2.000


#**************************************************************
# Set Input Transition
#**************************************************************
