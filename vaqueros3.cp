#line 1 "C:/Users/ale/Documents/vaqueros3/vaqueros3.c"








char dato[]={'0','|','0','|','0','|','0','|','0','|','0','|','0'};
char orden[10];

void main() {

 TRISA = 0b11111100;
 CMCON = 0b00000111;

 TRISB2_BIT = 0;
 TRISB1_BIT = 1;
 UART1_Init(9600);
 Delay_ms(100);

  PORTA.B0  = 0;
  PORTA.B1  = 0;
  PORTA.B2  = 1;
  PORTA.B3  = 1;
  PORTA.B4  = 1;
  PORTA.B6  = 1;
  PORTA.B7  = 1;

 while(1)
 {




 if( PORTA.B0 ){dato[0] = '1';}else{dato[0] = '0';}
 if( PORTA.B1 ){dato[2] = '1';}else{dato[2] = '0';}
 if( PORTA.B2 ){dato[4] = '1';}else{dato[4] = '0';}
 if( PORTA.B3 ){dato[6] = '1';}else{dato[6] = '0';}
 if( PORTA.B4 ){dato[8] = '1';}else{dato[8] = '0';}
 if( PORTA.B6 ){dato[10] = '1';}else{dato[10] = '0';}
 if( PORTA.B7 ){dato[12] = '1';}else{dato[12] = '0';}



 if( PORTA.B6  == 1 &&  PORTA.B3  == 0)
 {
  PORTA.B1  = 1;
 }
 if( PORTA.B7  == 0 ||  PORTA.B3  == 1)
 {
  PORTA.B1  = 0;
 }
 if( PORTA.B2  == 0 &&  PORTA.B3  == 1)
 {
  PORTA.B0  = 1;
 }
 if( PORTA.B4  == 0 ||  PORTA.B2  == 1)
 {
  PORTA.B0  = 0;
 }
 if (UART1_Data_Ready()==1)
 {
 UART1_Read_Text(orden,"_",10);

 if(strcmp(orden,"A") == 0 &&  PORTA.B4  == 1){
  PORTA.B0  = 1;
 }
 if(strcmp(orden,"B") == 0){
  PORTA.B0  = 0;
 }
 if(strcmp(orden,"C") == 0 &&  PORTA.B7  == 1){
  PORTA.B1  = 1;
 }
 if(strcmp(orden,"D") == 0){
  PORTA.B1  = 0;
 }
 }
 Delay_ms(3000);
 UART1_Write_Text(dato);
 }
}
