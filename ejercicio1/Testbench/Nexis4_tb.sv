`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2025 13:42:11
// Design Name: 
// Module Name: Nexis4_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Nexis4_tb;
    logic [15:0] swt;  
    logic [3:0]  btn;         
    logic [15:0] led;  
    
    // Instancia del módulo
    Top_FPGA Top (
        .swt       (swt),
        .btn       (btn),
        .led       (led)
    );
   
    initial begin
        $dumpfile("Nexis4_tb.vcd");
        $dumpvars(0, Nexis4_tb);
        
        // Caso 1: Todos los switches activos, sin presionar botón
        swt = 16'b1111000010100101;
        btn = 4'b0001;
        #10;
        
        // Caso 2: Apagar LEDs con botón presionado
        swt = 16'b1111000010100101;
        btn = 4'b1111;
        #10;
        
        // Caso 3: Alternar switches con botón no presionado
       swt = 16'b1111111111111111;
        btn = 0;
        #10;
       
        
        $finish;
    end
endmodule
