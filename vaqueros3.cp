#line 1 "C:/Users/ale/Documents/vaqueros3/vaqueros3.c"








char dato[]={'0','|','0','|','0','|','0','|','0','|','0','|','0','\0'};
int bom1;

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
#line 79 "C:/Users/ale/Documents/vaqueros3/vaqueros3.c"
 if (UART1_Data_Ready()==1)
 {

 UART1_Read_Text(orden,"_",10);



 if(strcmp(orden,"A") == 0){
  PORTA.B0  = 1;
 }
 if(strcmp(orden,"B") == 0){
  PORTA.B0  = 0;
 }

 if(strcmp(orden,"C") == 0){
  PORTA.B1  = 1;
 }
 if(strcmp(orden,"D") == 0){
  PORTA.B1  = 0;
 }
 UART1_Write_Text(orden);
 Delay_ms(1000);
 if( PORTA.B0  == 1){
 UART1_Write_Text("1");
 }else{
 UART1_Write_Text("0");
 }
 }
 Delay_ms(1000);
 }
}
