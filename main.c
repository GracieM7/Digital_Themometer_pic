#include "Lcd_i2c.h"        // Include the LCD library
#include <stdlib.h>         // Include standard library for FloatToStr function
#include <stdio.h>          // Include stdio.h for sprintf function

#define BUZZER PORTB.B0    // Define the buzzer pin
#define GREEN_LED PORTB.B3 // Define the green LED pin
#define RED_LED PORTB.B4   // Define the red LED pin

unsigned char txt[15];      // Define a character array for storing temperature as string

void main() {
    ADCON1 = 0x0E;          // Configure PORTA as digital
    TRISA.RA0 = 1;          // Set RA0 as input
    PORTB = 0x00;           // Initialize PORTB
    TRISB = 0;              // Set PORTB as output

    ADC_Init();             // Initialize ADC module
    I2C1_Init(100000);      // Initialize I2C communication
    I2C_LCD_Init();         // Initialize LCD module
    I2C_LCD_Cmd(_LCD_CLEAR);// Clear LCD display
    I2C_LCD_Cmd(_LCD_CURSOR_OFF); // Turn off cursor

    BUZZER = 0;             // Initialize buzzer to off
    GREEN_LED = 0;          // Initialize green LED to off
    RED_LED = 0;            // Initialize red LED to off

    // Main loop
    do {
        unsigned int adc_value;
        int temperature;

        // Read ADC value from LM35 sensor
        adc_value = ADC_Read(0);
        // Convert ADC value to temperature in Celsius
        temperature = (float)adc_value * 5.0 / 1024.0 * 100.0;

        // Convert temperature to string
        IntToStr(temperature, txt);

        // Display temperature on LCD
        I2C_LCD_Cmd(_LCD_CLEAR);
        I2C_LCD_Out(1, 1, "Temperature:");
        I2C_LCD_Out(2, 2, txt);
        I2C_LCD_Chr(2, 8, 233); // Display degree symbol on LCD
        I2C_LCD_Chr(2, 9, 'C'); // Display 'C' on LCD

        Delay_ms(300);      // Delay for readability

        // Check if temperature is greater than 50 degrees Celsius
        if (temperature > 50) {
        
          portb = 0b00001001;
            I2C_LCD_Cmd(_LCD_CLEAR); // Clear LCD
            I2C_LCD_Out(1, 1, "Fire is detected"); // Display message
            Delay_ms(500); // Wait
        } else {
           portb = 0b00010000;
            I2C_LCD_Cmd(_LCD_CLEAR); // Clear LCD again
        }
    } while (1); // Infinite loop

    return;
}
