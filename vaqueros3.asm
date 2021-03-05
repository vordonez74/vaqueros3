
_main:

;vaqueros3.c,14 :: 		void main() {
;vaqueros3.c,16 :: 		TRISA = 0b11111100;
	MOVLW      252
	MOVWF      TRISA+0
;vaqueros3.c,17 :: 		CMCON = 0b00000111; //Comparador desactivado
	MOVLW      7
	MOVWF      CMCON+0
;vaqueros3.c,19 :: 		TRISB2_BIT = 0; //Salida TX
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;vaqueros3.c,20 :: 		TRISB1_BIT = 1; //Entrada RX
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;vaqueros3.c,21 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;vaqueros3.c,22 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;vaqueros3.c,24 :: 		BOMBA1 = 0;
	BCF        PORTA+0, 0
;vaqueros3.c,25 :: 		BOMBA2 = 0;
	BCF        PORTA+0, 1
;vaqueros3.c,26 :: 		SENSOR1 = 1;
	BSF        PORTA+0, 2
;vaqueros3.c,27 :: 		SENSOR3 = 1;
	BSF        PORTA+0, 3
;vaqueros3.c,28 :: 		SENSOR4 = 1;
	BSF        PORTA+0, 4
;vaqueros3.c,29 :: 		SENSOR5 = 1;
	BSF        PORTA+0, 6
;vaqueros3.c,30 :: 		SENSOR6 = 1;
	BSF        PORTA+0, 7
;vaqueros3.c,32 :: 		while(1)
L_main1:
;vaqueros3.c,79 :: 		if (UART1_Data_Ready()==1)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;vaqueros3.c,82 :: 		UART1_Read_Text(orden,"_",10);
	MOVLW      _orden+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr1_vaqueros3+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      10
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;vaqueros3.c,86 :: 		if(strcmp(orden,"A") == 0){
	MOVLW      _orden+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr2_vaqueros3+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      0
	XORWF      R0+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;vaqueros3.c,87 :: 		BOMBA1 = 1;
	BSF        PORTA+0, 0
;vaqueros3.c,88 :: 		}
L_main4:
;vaqueros3.c,89 :: 		if(strcmp(orden,"B") == 0){
	MOVLW      _orden+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr3_vaqueros3+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      0
	XORWF      R0+0, 0
L__main14:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;vaqueros3.c,90 :: 		BOMBA1 = 0;
	BCF        PORTA+0, 0
;vaqueros3.c,91 :: 		}
L_main5:
;vaqueros3.c,93 :: 		if(strcmp(orden,"C") == 0){
	MOVLW      _orden+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr4_vaqueros3+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      0
	XORWF      R0+0, 0
L__main15:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;vaqueros3.c,94 :: 		BOMBA2 = 1;
	BSF        PORTA+0, 1
;vaqueros3.c,95 :: 		}
L_main6:
;vaqueros3.c,96 :: 		if(strcmp(orden,"D") == 0){
	MOVLW      _orden+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr5_vaqueros3+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      0
	XORWF      R0+0, 0
L__main16:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;vaqueros3.c,97 :: 		BOMBA2 = 0;
	BCF        PORTA+0, 1
;vaqueros3.c,98 :: 		}
L_main7:
;vaqueros3.c,99 :: 		UART1_Write_Text(orden);
	MOVLW      _orden+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;vaqueros3.c,100 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;vaqueros3.c,101 :: 		if(BOMBA1 == 1){
	BTFSS      PORTA+0, 0
	GOTO       L_main9
;vaqueros3.c,102 :: 		UART1_Write_Text("1");
	MOVLW      ?lstr6_vaqueros3+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;vaqueros3.c,103 :: 		}else{
	GOTO       L_main10
L_main9:
;vaqueros3.c,104 :: 		UART1_Write_Text("0");
	MOVLW      ?lstr7_vaqueros3+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;vaqueros3.c,105 :: 		}
L_main10:
;vaqueros3.c,106 :: 		}
L_main3:
;vaqueros3.c,107 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;vaqueros3.c,108 :: 		}
	GOTO       L_main1
;vaqueros3.c,109 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
