`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Student: Kendy Arias
// 
// Create Date: 02/25/2024 04:56:06 PM
// Design Name: Logica del Decodificador parte 2
// Module Name: logica_deco parte 2
// Target Devices: Basys 3 
// Description: Modulo que implementa la logica del decodificador con un multiplexor para poder elegir cual display y cuales entradas estan relacionadas
//
//////////////////////////////////////////////////////////////////////////////////
//Inicio del modulo
module logica_deco2(
    input [3:0] btn, //entradas de los botones designando switches especificos
    input [15:0] sw, //entradas de los switches
    output reg [0:6] seg, //salida a los segmentos
    output [3:0] an, // salida a los anodos
    output dp // decimal point
    );
    
        wire [1:0] s; //Selector del multiplexor
        reg [3:0] digit;
        
            assign x = 'h1234; //Diferentes displays
            assign an=~btn; //Logica del selector 
            assign s[1]=btn[2]| btn[3];
            assign s[0] = btn[1]|btn[3];
            assign dp =1; //Desactivo el decimal point
            
        //Multiplexor
        always @ (*)
            case (s)
                3: digit= sw[15:12];
                2: digit= sw[11:8];
                1: digit= sw[7:4];
                0: digit= sw[3:0];
                default: digit= sw[3:0];
            endcase
                       
        //7 segmentos
        always @(*)
            case(digit)        //Anodo comun: para encendido 0 y apagado 1, orden del display 7'babcdefg
                0: seg = 7'b0000001;
                1: seg = 7'b1001111;
                2: seg = 7'b0010010;
                3: seg = 7'b0000110;
                4: seg = 7'b1001100;
                5: seg = 7'b0100100;
                6: seg = 7'b0100000;
                7: seg = 7'b0001111;
                8: seg = 7'b0000000;
                9: seg = 7'b0000100;
                'hA: seg = 7'b0001000;
                'hB: seg = 7'b1100000;
                'hC: seg = 7'b0110001;
                'hD: seg = 7'b1000010;
                'hE: seg = 7'b0110000;
                'hF: seg = 7'b0111000;
                    default: seg = 7'b0000001;  //Default de valor 0
            endcase
endmodule
