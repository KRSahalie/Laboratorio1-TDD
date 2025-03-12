`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Student: Kendy Arias
// 
// Create Date: 02/25/2024 04:56:06 PM
// Design Name: Logica del Decodificador parte 1
// Module Name: logica_deco
// Target Devices: Basys 3 
// Description: Modulo que muestra la logica del decodificador 
//
//////////////////////////////////////////////////////////////////////////////////
module logica_deco(
    input [3:0] valor, //entrada de switches (anodos se repiten de 4 en 4)
    output reg [0:6] representacion // salida a los switches (segmentos repetidos de 4 en 4 en el display)
    );
    // Bucle del 7 segmentos
    
    always @(*)
        case(valor)        //Anodo comun: para encendido 0 y apagado 1, orden del display 7'babcdefg
            0: representacion = 7'b0000001;
            1: representacion = 7'b1001111;
            2: representacion = 7'b0010010;
            3: representacion = 7'b0000110;
            4: representacion = 7'b1001100;
            5: representacion = 7'b0100100;
            6: representacion = 7'b0100000;
            7: representacion = 7'b0001111;
            8: representacion = 7'b0000000;
            9: representacion = 7'b0000100;
            'hA: representacion = 7'b0001000;
            'hB: representacion = 7'b1100000;
            'hC: representacion = 7'b0110001;
            'hD: representacion = 7'b1000010;
            'hE: representacion = 7'b0110000;
            'hF: representacion = 7'b0111000;
                default: representacion = 7'b0000001;  //Default de valor 0
        endcase
endmodule


