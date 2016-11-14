/* This is our LCD module driver 
The LCD module is a display controller called HD44780.

Pin Assignments for LCD Module
LCD_DATA[7] 	PIN_M5		LCD Data[7] 
LCD_DATA[6] 	PIN_M3 		LCD Data[6] 
LCD_DATA[5] 	PIN_K2 		LCD Data[5] 
LCD_DATA[4] 	PIN_K1 		LCD Data[4] 
LCD_DATA[3] 	PIN_K7 		LCD Data[3]  
LCD_DATA[2] 	PIN_L2 		LCD Data[2] 
LCD_DATA[1] 	PIN_L1 		LCD Data[1] 
LCD_DATA[0] 	PIN_L3 		LCD Data[0] 

LCD_EN 			PIN_L4 		LCD Enable 3.3V
LCD_RW 			PIN_M1 		LCD Read/Write Select, 0 = Write, 1 = Read 
LCD_RS 			PIN_M2 		LCD Command/Data Select, 0 = Command, 1 = Data
LCD_ON 			PIN_L5 		LCD Power ON/OFF 3.3V

--> NOTE: NO BACKLIGHT ON DE2-115 LCD <--
LCD_BLON 		PIN_L6 		LCD Back Light ON/OFF 

Resources:
1. http://www.protostack.com/blog/2010/03/character-lcd-displays-part-1/
2. http://irtfweb.ifa.hawaii.edu/~tcs3/tcs3/vendor_info/Technologic_systems/embeddedx86/HD44780_LCD/lcd0.shtml.htm
3. http://www.pyroelectro.com/tutorials/fpga_lcd_interface/theory.html
4. http://fpga4fun.com/TextLCDmodule.html
5. http://faculty.utpa.edu/kuangw/courses/ELEE4303/ch8_part3.pdf
6. https://www.sparkfun.com/datasheets/LCD/HD44780.pdf
*/

module LCD();


endmodule