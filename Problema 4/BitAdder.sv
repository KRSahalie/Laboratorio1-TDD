`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2023 04:57:41 PM
// Design Name: 
// Module Name: BitAdder
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


module BitAdder(
input wire A,     
input wire B,     
input wire C,   
output wire suma,  
output wire carry);

wire Res_Suma = (A & (C)) | ((~A) & C);
wire Res_Carry = (A & B) | ((A) & (C | B));

assign suma = Res_Suma;
assign carry = Res_Carry;

endmodule