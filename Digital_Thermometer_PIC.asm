
_I2C_LCD_Cmd:

;lcd_i2c.h,23 :: 		void I2C_LCD_Cmd(char out_char) {
;lcd_i2c.h,26 :: 		char rs = 0x00;
	CLRF       I2C_LCD_Cmd_rs_L0+0
;lcd_i2c.h,28 :: 		hi_n = out_char & 0xF0;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      I2C_LCD_Cmd_hi_n_L0+0
;lcd_i2c.h,29 :: 		lo_n = (out_char << 4) & 0xF0;
	MOVF       FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      I2C_LCD_Cmd_lo_n_L0+0
	RLF        I2C_LCD_Cmd_lo_n_L0+0, 1
	BCF        I2C_LCD_Cmd_lo_n_L0+0, 0
	RLF        I2C_LCD_Cmd_lo_n_L0+0, 1
	BCF        I2C_LCD_Cmd_lo_n_L0+0, 0
	RLF        I2C_LCD_Cmd_lo_n_L0+0, 1
	BCF        I2C_LCD_Cmd_lo_n_L0+0, 0
	RLF        I2C_LCD_Cmd_lo_n_L0+0, 1
	BCF        I2C_LCD_Cmd_lo_n_L0+0, 0
	MOVLW      240
	ANDWF      I2C_LCD_Cmd_lo_n_L0+0, 1
;lcd_i2c.h,31 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;lcd_i2c.h,32 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,33 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lcd_i2c.h,34 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,35 :: 		I2C1_Wr(hi_n | rs | 0x04 | 0x08);
	MOVF       I2C_LCD_Cmd_rs_L0+0, 0
	IORWF      I2C_LCD_Cmd_hi_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,36 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,37 :: 		Delay_us(50);
	MOVLW      33
	MOVWF      R13+0
L_I2C_LCD_Cmd0:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd0
;lcd_i2c.h,38 :: 		I2C1_Wr(hi_n | rs | 0x00 | 0x08);
	MOVF       I2C_LCD_Cmd_rs_L0+0, 0
	IORWF      I2C_LCD_Cmd_hi_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,39 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,40 :: 		Delay_us(100);
	MOVLW      66
	MOVWF      R13+0
L_I2C_LCD_Cmd1:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd1
	NOP
;lcd_i2c.h,41 :: 		I2C1_Wr(lo_n | rs | 0x04 | 0x08);
	MOVF       I2C_LCD_Cmd_rs_L0+0, 0
	IORWF      I2C_LCD_Cmd_lo_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,42 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,43 :: 		Delay_us(50);
	MOVLW      33
	MOVWF      R13+0
L_I2C_LCD_Cmd2:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd2
;lcd_i2c.h,44 :: 		I2C1_Wr(lo_n | rs | 0x00 | 0x08);
	MOVF       I2C_LCD_Cmd_rs_L0+0, 0
	IORWF      I2C_LCD_Cmd_lo_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,45 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,46 :: 		I2C1_stop();
	CALL       _I2C1_Stop+0
;lcd_i2c.h,48 :: 		if(out_char == 0x01)Delay_ms(2);
	MOVF       FARG_I2C_LCD_Cmd_out_char+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_LCD_Cmd3
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_I2C_LCD_Cmd4:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd4
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd4
	NOP
L_I2C_LCD_Cmd3:
;lcd_i2c.h,49 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN
; end of _I2C_LCD_Cmd

_I2C_LCD_Chr:

;lcd_i2c.h,51 :: 		void I2C_LCD_Chr(char row, char column, char out_char) {
;lcd_i2c.h,54 :: 		char rs = 0x01;
	MOVLW      1
	MOVWF      I2C_LCD_Chr_rs_L0+0
;lcd_i2c.h,56 :: 		switch(row){
	GOTO       L_I2C_LCD_Chr5
;lcd_i2c.h,58 :: 		case 1:
L_I2C_LCD_Chr7:
;lcd_i2c.h,59 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      128
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.h,60 :: 		break;
	GOTO       L_I2C_LCD_Chr6
;lcd_i2c.h,61 :: 		case 2:
L_I2C_LCD_Chr8:
;lcd_i2c.h,62 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      192
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.h,63 :: 		break;
	GOTO       L_I2C_LCD_Chr6
;lcd_i2c.h,64 :: 		case 3:
L_I2C_LCD_Chr9:
;lcd_i2c.h,65 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      148
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.h,66 :: 		break;
	GOTO       L_I2C_LCD_Chr6
;lcd_i2c.h,67 :: 		case 4:
L_I2C_LCD_Chr10:
;lcd_i2c.h,68 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      212
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.h,69 :: 		break;
	GOTO       L_I2C_LCD_Chr6
;lcd_i2c.h,70 :: 		};
L_I2C_LCD_Chr5:
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr7
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr8
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr9
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr10
L_I2C_LCD_Chr6:
;lcd_i2c.h,72 :: 		hi_n = out_char & 0xF0;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      I2C_LCD_Chr_hi_n_L0+0
;lcd_i2c.h,73 :: 		lo_n = (out_char << 4) & 0xF0;
	MOVF       FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      I2C_LCD_Chr_lo_n_L0+0
	RLF        I2C_LCD_Chr_lo_n_L0+0, 1
	BCF        I2C_LCD_Chr_lo_n_L0+0, 0
	RLF        I2C_LCD_Chr_lo_n_L0+0, 1
	BCF        I2C_LCD_Chr_lo_n_L0+0, 0
	RLF        I2C_LCD_Chr_lo_n_L0+0, 1
	BCF        I2C_LCD_Chr_lo_n_L0+0, 0
	RLF        I2C_LCD_Chr_lo_n_L0+0, 1
	BCF        I2C_LCD_Chr_lo_n_L0+0, 0
	MOVLW      240
	ANDWF      I2C_LCD_Chr_lo_n_L0+0, 1
;lcd_i2c.h,75 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;lcd_i2c.h,76 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,77 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lcd_i2c.h,78 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,79 :: 		I2C1_Wr(hi_n | rs | 0x04 | 0x08);
	MOVF       I2C_LCD_Chr_rs_L0+0, 0
	IORWF      I2C_LCD_Chr_hi_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,80 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,81 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_I2C_LCD_Chr11:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr11
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr11
	NOP
	NOP
;lcd_i2c.h,82 :: 		I2C1_Wr(hi_n | rs | 0x00 | 0x08);
	MOVF       I2C_LCD_Chr_rs_L0+0, 0
	IORWF      I2C_LCD_Chr_hi_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,83 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,84 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_I2C_LCD_Chr12:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr12
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr12
	NOP
;lcd_i2c.h,85 :: 		I2C1_Wr(lo_n | rs | 0x04 | 0x08);
	MOVF       I2C_LCD_Chr_rs_L0+0, 0
	IORWF      I2C_LCD_Chr_lo_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,86 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,87 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_I2C_LCD_Chr13:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr13
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Chr13
	NOP
	NOP
;lcd_i2c.h,88 :: 		I2C1_Wr(lo_n | rs | 0x00 | 0x08);
	MOVF       I2C_LCD_Chr_rs_L0+0, 0
	IORWF      I2C_LCD_Chr_lo_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,89 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,90 :: 		I2C1_stop();
	CALL       _I2C1_Stop+0
;lcd_i2c.h,91 :: 		}
L_end_I2C_LCD_Chr:
	RETURN
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;lcd_i2c.h,93 :: 		void I2C_LCD_Chr_Cp(char out_char) {
;lcd_i2c.h,96 :: 		char rs = 0x01;
	MOVLW      1
	MOVWF      I2C_LCD_Chr_Cp_rs_L0+0
;lcd_i2c.h,98 :: 		hi_n = out_char & 0xF0;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      I2C_LCD_Chr_Cp_hi_n_L0+0
;lcd_i2c.h,99 :: 		lo_n = (out_char << 4) & 0xF0;
	MOVF       FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      I2C_LCD_Chr_Cp_lo_n_L0+0
	RLF        I2C_LCD_Chr_Cp_lo_n_L0+0, 1
	BCF        I2C_LCD_Chr_Cp_lo_n_L0+0, 0
	RLF        I2C_LCD_Chr_Cp_lo_n_L0+0, 1
	BCF        I2C_LCD_Chr_Cp_lo_n_L0+0, 0
	RLF        I2C_LCD_Chr_Cp_lo_n_L0+0, 1
	BCF        I2C_LCD_Chr_Cp_lo_n_L0+0, 0
	RLF        I2C_LCD_Chr_Cp_lo_n_L0+0, 1
	BCF        I2C_LCD_Chr_Cp_lo_n_L0+0, 0
	MOVLW      240
	ANDWF      I2C_LCD_Chr_Cp_lo_n_L0+0, 1
;lcd_i2c.h,101 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;lcd_i2c.h,102 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,103 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lcd_i2c.h,104 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,105 :: 		I2C1_Wr(hi_n | rs | 0x04 | 0x08);
	MOVF       I2C_LCD_Chr_Cp_rs_L0+0, 0
	IORWF      I2C_LCD_Chr_Cp_hi_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,106 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,107 :: 		Delay_us(300);
	MOVLW      199
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp14:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp14
	NOP
	NOP
;lcd_i2c.h,108 :: 		I2C1_Wr(hi_n | rs | 0x00 | 0x08);
	MOVF       I2C_LCD_Chr_Cp_rs_L0+0, 0
	IORWF      I2C_LCD_Chr_Cp_hi_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,109 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,110 :: 		Delay_us(100);
	MOVLW      66
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp15:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp15
	NOP
;lcd_i2c.h,111 :: 		I2C1_Wr(lo_n | rs | 0x04 | 0x08);
	MOVF       I2C_LCD_Chr_Cp_rs_L0+0, 0
	IORWF      I2C_LCD_Chr_Cp_lo_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,112 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,113 :: 		Delay_us(300);
	MOVLW      199
	MOVWF      R13+0
L_I2C_LCD_Chr_Cp16:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Chr_Cp16
	NOP
	NOP
;lcd_i2c.h,114 :: 		I2C1_Wr(lo_n | rs | 0x00 | 0x08);
	MOVF       I2C_LCD_Chr_Cp_rs_L0+0, 0
	IORWF      I2C_LCD_Chr_Cp_lo_n_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,115 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,116 :: 		I2C1_stop();
	CALL       _I2C1_Stop+0
;lcd_i2c.h,117 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Init:

;lcd_i2c.h,120 :: 		void I2C_LCD_Init() {
;lcd_i2c.h,122 :: 		char rs = 0x00;
	CLRF       I2C_LCD_Init_rs_L0+0
;lcd_i2c.h,124 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;lcd_i2c.h,125 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,126 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lcd_i2c.h,127 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,129 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_I2C_LCD_Init17:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init17
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init17
;lcd_i2c.h,131 :: 		I2C1_Wr(0x30 | rs | 0x04 | 0x08);
	MOVLW      48
	IORWF      I2C_LCD_Init_rs_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,132 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,133 :: 		Delay_us(50);
	MOVLW      33
	MOVWF      R13+0
L_I2C_LCD_Init18:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init18
;lcd_i2c.h,134 :: 		I2C1_Wr(0x30 | rs | 0x00 | 0x08);
	MOVLW      48
	IORWF      I2C_LCD_Init_rs_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,135 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,137 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_I2C_LCD_Init19:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init19
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init19
	NOP
;lcd_i2c.h,139 :: 		I2C1_Wr(0x30 | rs | 0x04 | 0x08);
	MOVLW      48
	IORWF      I2C_LCD_Init_rs_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,140 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,141 :: 		Delay_us(50);
	MOVLW      33
	MOVWF      R13+0
L_I2C_LCD_Init20:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init20
;lcd_i2c.h,142 :: 		I2C1_Wr(0x30 | rs | 0x00 | 0x08);
	MOVLW      48
	IORWF      I2C_LCD_Init_rs_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,143 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,145 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_I2C_LCD_Init21:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init21
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init21
	NOP
;lcd_i2c.h,147 :: 		I2C1_Wr(0x30 | rs | 0x04 | 0x08);
	MOVLW      48
	IORWF      I2C_LCD_Init_rs_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,148 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,149 :: 		Delay_us(50);
	MOVLW      33
	MOVWF      R13+0
L_I2C_LCD_Init22:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init22
;lcd_i2c.h,150 :: 		I2C1_Wr(0x30 | rs | 0x00 | 0x08);
	MOVLW      48
	IORWF      I2C_LCD_Init_rs_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,151 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,153 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_I2C_LCD_Init23:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init23
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init23
	NOP
;lcd_i2c.h,155 :: 		I2C1_Wr(0x20 | rs | 0x04 | 0x08);
	MOVLW      32
	IORWF      I2C_LCD_Init_rs_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 2
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,156 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,157 :: 		Delay_us(50);
	MOVLW      33
	MOVWF      R13+0
L_I2C_LCD_Init24:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init24
;lcd_i2c.h,158 :: 		I2C1_Wr(0x20 | rs | 0x00 | 0x08);
	MOVLW      32
	IORWF      I2C_LCD_Init_rs_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	BSF        FARG_I2C1_Wr_data_+0, 3
	CALL       _I2C1_Wr+0
;lcd_i2c.h,159 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lcd_i2c.h,160 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;lcd_i2c.h,162 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_I2C_LCD_Init25:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init25
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init25
	NOP
;lcd_i2c.h,164 :: 		I2C_LCD_Cmd(0x28);
	MOVLW      40
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.h,165 :: 		I2C_LCD_Cmd(0x06);
	MOVLW      6
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lcd_i2c.h,166 :: 		}
L_end_I2C_LCD_Init:
	RETURN
; end of _I2C_LCD_Init

_I2C_LCD_Out:

;lcd_i2c.h,168 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;lcd_i2c.h,169 :: 		while(*text)
L_I2C_LCD_Out26:
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out27
;lcd_i2c.h,170 :: 		I2C_LCD_Chr(row, col++, *text++);
	MOVF       FARG_I2C_LCD_Out_row+0, 0
	MOVWF      FARG_I2C_LCD_Chr_row+0
	MOVF       FARG_I2C_LCD_Out_col+0, 0
	MOVWF      FARG_I2C_LCD_Chr_column+0
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_out_char+0
	CALL       _I2C_LCD_Chr+0
	INCF       FARG_I2C_LCD_Out_col+0, 1
	INCF       FARG_I2C_LCD_Out_text+0, 1
	GOTO       L_I2C_LCD_Out26
L_I2C_LCD_Out27:
;lcd_i2c.h,171 :: 		}
L_end_I2C_LCD_Out:
	RETURN
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;lcd_i2c.h,173 :: 		void I2C_LCD_Out_Cp(char *text) {
;lcd_i2c.h,174 :: 		while(*text)
L_I2C_LCD_Out_Cp28:
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out_Cp29
;lcd_i2c.h,175 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_Cp_out_char+0
	CALL       _I2C_LCD_Chr_Cp+0
	INCF       FARG_I2C_LCD_Out_Cp_text+0, 1
	GOTO       L_I2C_LCD_Out_Cp28
L_I2C_LCD_Out_Cp29:
;lcd_i2c.h,176 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN
; end of _I2C_LCD_Out_Cp

_main:

;Digital_Thermometer_PIC.c,11 :: 		void main() {
;Digital_Thermometer_PIC.c,12 :: 		ADCON1 = 0x0E;          // Configure PORTA as digital
	MOVLW      14
	MOVWF      ADCON1+0
;Digital_Thermometer_PIC.c,13 :: 		TRISA.RA0 = 1;          // Set RA0 as input
	BSF        TRISA+0, 0
;Digital_Thermometer_PIC.c,14 :: 		PORTB = 0x00;           // Initialize PORTB
	CLRF       PORTB+0
;Digital_Thermometer_PIC.c,15 :: 		TRISB = 0xFE; // Set RB0 as output and others as input
	MOVLW      254
	MOVWF      TRISB+0
;Digital_Thermometer_PIC.c,16 :: 		ADC_Init();             // Initialize ADC module
	CALL       _ADC_Init+0
;Digital_Thermometer_PIC.c,17 :: 		I2C1_Init(100000);      // Initialize I2C communication
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;Digital_Thermometer_PIC.c,18 :: 		I2C_LCD_Init();         // Initialize LCD module
	CALL       _I2C_LCD_Init+0
;Digital_Thermometer_PIC.c,19 :: 		I2C_LCD_Cmd(_LCD_CLEAR);// Clear LCD display
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;Digital_Thermometer_PIC.c,20 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF); // Turn off cursor
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;Digital_Thermometer_PIC.c,23 :: 		do {
L_main30:
;Digital_Thermometer_PIC.c,28 :: 		adc_value = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;Digital_Thermometer_PIC.c,30 :: 		temperature = (float)adc_value * 5.0 / 1024.0 * 100.0;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      main_temperature_L1+0
	MOVF       R0+1, 0
	MOVWF      main_temperature_L1+1
;Digital_Thermometer_PIC.c,33 :: 		IntToStr(temperature, txt);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Digital_Thermometer_PIC.c,36 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;Digital_Thermometer_PIC.c,37 :: 		I2C_LCD_Out(1, 1, "Temperature:");
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr1_Digital_Thermometer_PIC+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;Digital_Thermometer_PIC.c,38 :: 		I2C_LCD_Out(2, 2, txt);
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      _txt+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;Digital_Thermometer_PIC.c,39 :: 		I2C_LCD_Chr(2, 8, 233); // Display degree symbol on LCD
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Chr_row+0
	MOVLW      8
	MOVWF      FARG_I2C_LCD_Chr_column+0
	MOVLW      233
	MOVWF      FARG_I2C_LCD_Chr_out_char+0
	CALL       _I2C_LCD_Chr+0
;Digital_Thermometer_PIC.c,40 :: 		I2C_LCD_Chr(2, 9, 'C'); // Display 'C' on LCD
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Chr_row+0
	MOVLW      9
	MOVWF      FARG_I2C_LCD_Chr_column+0
	MOVLW      67
	MOVWF      FARG_I2C_LCD_Chr_out_char+0
	CALL       _I2C_LCD_Chr+0
;Digital_Thermometer_PIC.c,41 :: 		Delay_ms(300);      // Delay for readability
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
;Digital_Thermometer_PIC.c,44 :: 		if (temperature > 50) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_temperature_L1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVF       main_temperature_L1+0, 0
	SUBLW      50
L__main44:
	BTFSC      STATUS+0, 0
	GOTO       L_main34
;Digital_Thermometer_PIC.c,46 :: 		BUZZER = 0;
	BCF        PORTB+0, 0
;Digital_Thermometer_PIC.c,47 :: 		RED_LED = 0;
	BCF        PORTB+0, 4
;Digital_Thermometer_PIC.c,48 :: 		GREEN_LED = 1;
	BSF        PORTB+0, 3
;Digital_Thermometer_PIC.c,50 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;Digital_Thermometer_PIC.c,51 :: 		I2C_LCD_Out(1, 1, "Fire detected!"); // Display warning message
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr2_Digital_Thermometer_PIC+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;Digital_Thermometer_PIC.c,52 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
;Digital_Thermometer_PIC.c,53 :: 		} else {
	GOTO       L_main36
L_main34:
;Digital_Thermometer_PIC.c,55 :: 		BUZZER = 1;
	BSF        PORTB+0, 0
;Digital_Thermometer_PIC.c,56 :: 		RED_LED = 1;
	BSF        PORTB+0, 4
;Digital_Thermometer_PIC.c,57 :: 		GREEN_LED = 0;
	BCF        PORTB+0, 3
;Digital_Thermometer_PIC.c,58 :: 		}
L_main36:
;Digital_Thermometer_PIC.c,59 :: 		} while (1); // Infinite loop
	GOTO       L_main30
;Digital_Thermometer_PIC.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
