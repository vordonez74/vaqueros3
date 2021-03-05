
_main:

;vaqueros3.c,12 :: 		void main() {
;vaqueros3.c,14 :: 		TRISA = 0b11111100;
	MOVLW      252
	MOVWF      TRISA+0
;vaqueros3.c,15 :: 		CMCON = 0b00000111; //Comparador desactivado
	MOVLW      7
	MOVWF      CMCON+0
;vaqueros3.c,17 :: 		TRISB2_BIT = 0; //Salida TX
	BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;vaqueros3.c,18 :: 		TRISB1_BIT = 1; //Entrada RX
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;vaqueros3.c,19 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;vaqueros3.c,20 :: 		Delay_ms(100);
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
;vaqueros3.c,22 :: 		BOMBA1 = 1;
	BSF        PORTA+0, 0
;vaqueros3.c,23 :: 		BOMBA2 = 1;
	BSF        PORTA+0, 1
;vaqueros3.c,24 :: 		SENSOR1 = 1;
	BSF        PORTA+0, 2
;vaqueros3.c,25 :: 		SENSOR3 = 1;
	BSF        PORTA+0, 3
;vaqueros3.c,26 :: 		SENSOR4 = 1;
	BSF        PORTA+0, 4
;vaqueros3.c,27 :: 		SENSOR5 = 1;
	BSF        PORTA+0, 6
;vaqueros3.c,28 :: 		SENSOR6 = 1;
	BSF        PORTA+0, 7
;vaqueros3.c,30 :: 		while(1)
L_main1:
;vaqueros3.c,36 :: 		if(BOMBA1){dato[0] = '1';}else{dato[0] = '0';}
	BTFSS      PORTA+0, 0
	GOTO       L_main3
	MOVLW      49
	MOVWF      _dato+0
	GOTO       L_main4
L_main3:
	MOVLW      48
	MOVWF      _dato+0
L_main4:
;vaqueros3.c,37 :: 		if(BOMBA2){dato[2] = '1';}else{dato[2] = '0';}
	BTFSS      PORTA+0, 1
	GOTO       L_main5
	MOVLW      49
	MOVWF      _dato+2
	GOTO       L_main6
L_main5:
	MOVLW      48
	MOVWF      _dato+2
L_main6:
;vaqueros3.c,38 :: 		if(SENSOR1){dato[4] = '1';}else{dato[4] = '0';}
	BTFSS      PORTA+0, 2
	GOTO       L_main7
	MOVLW      49
	MOVWF      _dato+4
	GOTO       L_main8
L_main7:
	MOVLW      48
	MOVWF      _dato+4
L_main8:
;vaqueros3.c,39 :: 		if(SENSOR3){dato[6] = '1';}else{dato[6] = '0';}
	BTFSS      PORTA+0, 3
	GOTO       L_main9
	MOVLW      49
	MOVWF      _dato+6
	GOTO       L_main10
L_main9:
	MOVLW      48
	MOVWF      _dato+6
L_main10:
;vaqueros3.c,40 :: 		if(SENSOR4){dato[8] = '1';}else{dato[8] = '0';}
	BTFSS      PORTA+0, 4
	GOTO       L_main11
	MOVLW      49
	MOVWF      _dato+8
	GOTO       L_main12
L_main11:
	MOVLW      48
	MOVWF      _dato+8
L_main12:
;vaqueros3.c,41 :: 		if(SENSOR5){dato[10] = '1';}else{dato[10] = '0';}
	BTFSS      PORTA+0, 6
	GOTO       L_main13
	MOVLW      49
	MOVWF      _dato+10
	GOTO       L_main14
L_main13:
	MOVLW      48
	MOVWF      _dato+10
L_main14:
;vaqueros3.c,42 :: 		if(SENSOR6){dato[12] = '1';}else{dato[12] = '0';}
	BTFSS      PORTA+0, 7
	GOTO       L_main15
	MOVLW      49
	MOVWF      _dato+12
	GOTO       L_main16
L_main15:
	MOVLW      48
	MOVWF      _dato+12
L_main16:
;vaqueros3.c,63 :: 		if (UART1_Data_Ready()==1)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;vaqueros3.c,65 :: 		UART1_Read_Text(orden,"_",10); //void UARTx_Read_Text(char *Output, char *Delimiter, char Attempts);
	MOVLW      _orden+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr1_vaqueros3+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      10
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;vaqueros3.c,68 :: 		if(strcmp(orden,"A") == 0){
	MOVLW      _orden+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr2_vaqueros3+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      0
	XORWF      R0+0, 0
L__main24:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;vaqueros3.c,69 :: 		BOMBA1 = 0;
	BCF        PORTA+0, 0
;vaqueros3.c,70 :: 		}
L_main18:
;vaqueros3.c,71 :: 		if(strcmp(orden,"B") == 0){
	MOVLW      _orden+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr3_vaqueros3+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      0
	XORWF      R0+0, 0
L__main25:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;vaqueros3.c,72 :: 		BOMBA1 = 1;
	BSF        PORTA+0, 0
;vaqueros3.c,73 :: 		}
L_main19:
;vaqueros3.c,75 :: 		if(strcmp(orden,"C") == 0){
	MOVLW      _orden+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr4_vaqueros3+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      0
	XORWF      R0+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;vaqueros3.c,76 :: 		BOMBA2 = 0;
	BCF        PORTA+0, 1
;vaqueros3.c,77 :: 		}
L_main20:
;vaqueros3.c,78 :: 		if(strcmp(orden,"D") == 0){
	MOVLW      _orden+0
	MOVWF      FARG_strcmp_s1+0
	MOVLW      ?lstr5_vaqueros3+0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      0
	XORWF      R0+0, 0
L__main27:
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;vaqueros3.c,79 :: 		BOMBA2 = 1;
	BSF        PORTA+0, 1
;vaqueros3.c,80 :: 		}
L_main21:
;vaqueros3.c,81 :: 		}
L_main17:
;vaqueros3.c,82 :: 		Delay_ms(3000);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;vaqueros3.c,83 :: 		UART1_Write_Text(dato);
	MOVLW      _dato+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;vaqueros3.c,84 :: 		}
	GOTO       L_main1
;vaqueros3.c,85 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
