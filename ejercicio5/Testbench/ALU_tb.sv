`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 14:48:44
// Design Name: 
// Module Name: Alu_tb
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


module Alu_tb;

logic [3:0] A;
logic [3:0] B;
logic [3:0] Alu_control;
logic       ALUFlagsIn;

logic [3:0] result;
logic       ALUFlags;
logic       C; 

Alu Alu_X(
.A              (A),
.B              (B),
.Alu_control    (Alu_control),
.result         (result),
.ALUFlagsIn     (ALUFlagsIn),
.ALUFlags       (ALUFlags),
.C              (C)
    );


initial begin
$dumpfile("Alu_tb.vcd");
$dumpvars(0, Alu_tb);

 A = 4'b1111;
 B = 4'b0011;
 ALUFlagsIn = 1'b0;
 Alu_control = 4'h0; //and
 
 #5
 
 Alu_control = 4'h1; //or
 
 #5
 
 Alu_control = 4'h2; //suma
 
 #5
 
 Alu_control = 4'h3; //A(0) B(1)suma 1 
 
 #5

 Alu_control = 4'h4; //A(0) B(1)resta 1
 
 #5
 
 Alu_control = 4'h5; //not
 
 #5
 
 Alu_control = 4'h6; //resta
 
 #5
 
 Alu_control = 4'h7; //xor
 
 #5
 
 Alu_control = 4'h8; //corrimiento izquierda
 
 #5
 
 Alu_control = 4'h9; //corrimiento derecha
 
 #5
$finish;
end
endmodule
