#line 1 "D:/Test_EmbeddedPIC/Digital_Thermometer_PIC.c"
#line 1 "d:/test_embeddedpic/lcd_i2c.h"
#line 23 "d:/test_embeddedpic/lcd_i2c.h"
void I2C_LCD_Cmd(char out_char) {

 char hi_n, lo_n;
 char rs = 0x00;

 hi_n = out_char & 0xF0;
 lo_n = (out_char << 4) & 0xF0;

 I2C1_Start();
 I2C1_Is_Idle();
 I2C1_Wr( 0x4E );
 I2C1_Is_Idle();
 I2C1_Wr(hi_n | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_us(50);
 I2C1_Wr(hi_n | rs | 0x00 | 0x08);
 I2C1_Is_Idle();
 Delay_us(100);
 I2C1_Wr(lo_n | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_us(50);
 I2C1_Wr(lo_n | rs | 0x00 | 0x08);
 I2C1_Is_Idle();
 I2C1_stop();

 if(out_char == 0x01)Delay_ms(2);
}

void I2C_LCD_Chr(char row, char column, char out_char) {

 char hi_n, lo_n;
 char rs = 0x01;

 switch(row){

 case 1:
 I2C_LCD_Cmd(0x80 + (column - 1));
 break;
 case 2:
 I2C_LCD_Cmd(0xC0 + (column - 1));
 break;
 case 3:
 I2C_LCD_Cmd(0x94 + (column - 1));
 break;
 case 4:
 I2C_LCD_Cmd(0xD4 + (column - 1));
 break;
 };

 hi_n = out_char & 0xF0;
 lo_n = (out_char << 4) & 0xF0;

 I2C1_Start();
 I2C1_Is_Idle();
 I2C1_Wr( 0x4E );
 I2C1_Is_Idle();
 I2C1_Wr(hi_n | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_ms(5);
 I2C1_Wr(hi_n | rs | 0x00 | 0x08);
 I2C1_Is_Idle();
 Delay_ms(10);
 I2C1_Wr(lo_n | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_ms(5);
 I2C1_Wr(lo_n | rs | 0x00 | 0x08);
 I2C1_Is_Idle();
 I2C1_stop();
}

void I2C_LCD_Chr_Cp(char out_char) {

 char hi_n, lo_n;
 char rs = 0x01;

 hi_n = out_char & 0xF0;
 lo_n = (out_char << 4) & 0xF0;

 I2C1_Start();
 I2C1_Is_Idle();
 I2C1_Wr( 0x4E );
 I2C1_Is_Idle();
 I2C1_Wr(hi_n | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_us(300);
 I2C1_Wr(hi_n | rs | 0x00 | 0x08);
 I2C1_Is_Idle();
 Delay_us(100);
 I2C1_Wr(lo_n | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_us(300);
 I2C1_Wr(lo_n | rs | 0x00 | 0x08);
 I2C1_Is_Idle();
 I2C1_stop();
}


void I2C_LCD_Init() {

 char rs = 0x00;

 I2C1_Start();
 I2C1_Is_Idle();
 I2C1_Wr( 0x4E );
 I2C1_Is_Idle();

 Delay_ms(30);

 I2C1_Wr(0x30 | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_us(50);
 I2C1_Wr(0x30 | rs | 0x00 | 0x08);
 I2C1_Is_Idle();

 Delay_ms(10);

 I2C1_Wr(0x30 | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_us(50);
 I2C1_Wr(0x30 | rs | 0x00 | 0x08);
 I2C1_Is_Idle();

 Delay_ms(10);

 I2C1_Wr(0x30 | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_us(50);
 I2C1_Wr(0x30 | rs | 0x00 | 0x08);
 I2C1_Is_Idle();

 Delay_ms(10);

 I2C1_Wr(0x20 | rs | 0x04 | 0x08);
 I2C1_Is_Idle();
 Delay_us(50);
 I2C1_Wr(0x20 | rs | 0x00 | 0x08);
 I2C1_Is_Idle();
 I2C1_Stop();

 Delay_ms(10);

 I2C_LCD_Cmd(0x28);
 I2C_LCD_Cmd(0x06);
}

void I2C_LCD_Out(char row, char col, char *text) {
 while(*text)
 I2C_LCD_Chr(row, col++, *text++);
}

void I2C_LCD_Out_Cp(char *text) {
 while(*text)
 I2C_LCD_Chr_Cp(*text++);
}
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
int max(int a, int b);
int min(int a, int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdio.h"
#line 9 "D:/Test_EmbeddedPIC/Digital_Thermometer_PIC.c"
unsigned char txt[15];

void main() {
 ADCON1 = 0x0E;
 TRISA.RA0 = 1;
 PORTB = 0x00;
 TRISB = 0xFE;
 ADC_Init();
 I2C1_Init(100000);
 I2C_LCD_Init();
 I2C_LCD_Cmd( 0x01 );
 I2C_LCD_Cmd( 0x0C );


 do {
 unsigned int adc_value;
 int temperature;


 adc_value = ADC_Read(0);

 temperature = (float)adc_value * 5.0 / 1024.0 * 100.0;


 IntToStr(temperature, txt);


 I2C_LCD_Cmd( 0x01 );
 I2C_LCD_Out(1, 1, "Temperature:");
 I2C_LCD_Out(2, 2, txt);
 I2C_LCD_Chr(2, 8, 233);
 I2C_LCD_Chr(2, 9, 'C');
 Delay_ms(300);


 if (temperature > 50) {

  PORTB.B0  = 0;
  PORTB.B4  = 0;
  PORTB.B3  = 1;

 I2C_LCD_Cmd( 0x01 );
 I2C_LCD_Out(1, 1, "Fire detected!");
 delay_ms(100);
 } else {

  PORTB.B0  = 1;
  PORTB.B4  = 1;
  PORTB.B3  = 0;
 }
 } while (1);

 return;
}
