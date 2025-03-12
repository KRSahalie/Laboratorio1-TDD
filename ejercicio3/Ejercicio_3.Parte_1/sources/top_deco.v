`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Student: Kendy Arias
// 
// Create Date: 02/25/2024 04:56:06 PM
// Design Name: Top del Decodificador parte 1
// Module Name: top_deco
// Target Devices: Basys 3 
// Description: Modulo que implementa la logica del decodificador a la FPGA
//
//////////////////////////////////////////////////////////////////////////////////

module top_deco(
    input [3:0] sw,
    output [0:6] seg,
    output [3:0] an,
    output dp
    );
        assign an= 4'b0000; //Todos los anodos encendidos
        assign dp =1; //Apago el punto (decimal point)
        logica_deco U1(.valor(sw), .representacion(seg)); //Uniendo entradas/salidas del top con el modulo de logica
endmodule
