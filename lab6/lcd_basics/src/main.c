#include "lpc24xx.h"
#include "delay.h"
#include "lcd/lcd_hw.h"
#include "lcd/lcd_grph.h"
#include "lcd/lcd_cfg.h"
#include "lcd/sdram.h"

int main(void) {
	//Setup external SDRAM. Used for Frame Buffer
	sdramInit();	
	
	//Setup LPC2478 LCD Controller for our specific LCD
	//lcd_config is defined in lcd/lcd_cfg.h
	lcdInit(&lcd_config); 
	
	//Turn the LCD on
	lcdTurnOn();
	
	//Draw a background with lcd_fillScreen
	//Otherwise you will write random noise to the screen!
	lcd_fillScreen(WHITE);
	
	//Draw some shapes now!
	//....
	lcd_drawRect(40, 10, 50, 50, BLACK);
	lcd_fillcircle(100, 200, 50, YELLOW);
	lcd_line(200, 300, 50, 10, BLACK);


	//Do nothing more
	while (1) { }
}
