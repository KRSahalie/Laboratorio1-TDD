`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 14:37:13
// Design Name: 
// Module Name: Switch
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


module Nexis4(
  input logic   [3:0] swt,
  input logic	      btn,
  
  output logic  [3:0] led
);
  
  assign led[0] = btn ? 1'b0 : swt[0];
  assign led[1] = btn ? 1'b0 : swt[1];
  assign led[2] = btn ? 1'b0 : swt[2];
  assign led[3] = btn ? 1'b0 : swt[3];
endmodule
