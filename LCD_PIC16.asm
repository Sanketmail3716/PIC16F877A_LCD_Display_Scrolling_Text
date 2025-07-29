
_Move_Delay:

;LCD_PIC16.c,23 :: 		void Move_Delay() {                  // Function used for text moving
;LCD_PIC16.c,24 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
;LCD_PIC16.c,25 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;LCD_PIC16.c,27 :: 		void main(){
;LCD_PIC16.c,30 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;LCD_PIC16.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_PIC16.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_PIC16.c,34 :: 		Lcd_Out(1,6,"SANKET");                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD_PIC16+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_PIC16.c,36 :: 		Lcd_Out(2,6,"MALI");                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD_PIC16+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_PIC16.c,41 :: 		while(1) {                         // Endless loop
L_main1:
;LCD_PIC16.c,43 :: 		}
	GOTO       L_main1
;LCD_PIC16.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
