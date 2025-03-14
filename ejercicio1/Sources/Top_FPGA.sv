`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2025 13:40:24
// Design Name: 
// Module Name: Top_FPGA
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

module Top_FPGA(
input logic  [15:0]	swt,
input logic  [3:0]	btn,
output logic [15:0]	led
    );

Nexis4 Unidad1 (
        .swt       (swt[3:0]),
        .btn       (btn[0]),
        .led       (led[3:0])
    );
    
Nexis4 Unidad2 (
        .swt       (swt[7:4]),
        .btn       (btn[1]),
        .led       (led[7:4])
    );
    
Nexis4 Unidad3 (
        .swt       (swt[11:8]),
        .btn       (btn[2]),
        .led       (led[11:8])
    );
    
Nexis4 Unidad4 (
        .swt       (swt[15:12]),
        .btn       (btn[3]),
        .led       (led[15:12])
    );
endmodule