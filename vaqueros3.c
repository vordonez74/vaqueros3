#define BOMBA1 PORTA.B0
#define BOMBA2 PORTA.B1
#define SENSOR1 PORTA.B2
#define SENSOR3 PORTA.B3
#define SENSOR4 PORTA.B4
#define SENSOR5 PORTA.B6
#define SENSOR6 PORTA.B7
                 //REVISAR DEFINICION DE VECTOR SI TERMINA \0
char dato[]={'0','|','0','|','0','|','0','|','0','|','0','|','0'}; //Vector que guarda el estado de las bombas y los sensores
char orden[10];

void main() {

    TRISA = 0b11111100;
    CMCON = 0b00000111; //Comparador desactivado

    TRISB2_BIT = 0; //Salida TX
    TRISB1_BIT = 1; //Entrada RX
    UART1_Init(9600);
    Delay_ms(100);

    BOMBA1 = 1;
    BOMBA2 = 1;
    SENSOR1 = 1;
    SENSOR3 = 1;
    SENSOR4 = 1;
    SENSOR5 = 1;
    SENSOR6 = 1;

    while(1)
    {
        //char *strcat(char *s1, char *s2);
        //void IntToStr(int number, char *output); o usar (char) number;
        //void UARTx_Write_Text(char * UART_text);

        if(BOMBA1){dato[0] = '1';}else{dato[0] = '0';}
        if(BOMBA2){dato[2] = '1';}else{dato[2] = '0';}
        if(SENSOR1){dato[4] = '1';}else{dato[4] = '0';}
        if(SENSOR3){dato[6] = '1';}else{dato[6] = '0';}
        if(SENSOR4){dato[8] = '1';}else{dato[8] = '0';}
        if(SENSOR5){dato[10] = '1';}else{dato[10] = '0';}
        if(SENSOR6){dato[12] = '1';}else{dato[12] = '0';}

        //los sensores se activan con un 0
        /*
        if(SENSOR5 == 1 && SENSOR3 == 0)
        {
            BOMBA2 = 0;
        }
        if(SENSOR6 == 0 || SENSOR3 == 1)
        {
            BOMBA2 = 1;
        }
        if(SENSOR1 == 0 && SENSOR3 == 1)
        {
            BOMBA1 = 0;
        }
        if(SENSOR4 == 0 || SENSOR1 == 1)
        {
            BOMBA1 = 1;
        }
        */
        if (UART1_Data_Ready()==1)
        {
            UART1_Read_Text(orden,"_",10); //void UARTx_Read_Text(char *Output, char *Delimiter, char Attempts);

            //if(strcmp(orden,"A") == 0 && SENSOR4 == 1){   //char strcmp(char *s1, char *s2);
            if(strcmp(orden,"A") == 0){
                BOMBA1 = 0;
            }
            if(strcmp(orden,"B") == 0){
                BOMBA1 = 1;
            }
            //if(strcmp(orden,"C") == 0 && SENSOR6 == 1){
            if(strcmp(orden,"C") == 0){
                BOMBA2 = 0;
            }
            if(strcmp(orden,"D") == 0){
                BOMBA2 = 1;
            }
        }
        Delay_ms(3000);
        UART1_Write_Text(dato);
    }
}