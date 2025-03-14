`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 09:52:20 PM
// Design Name: 
// Module Name: testbench
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


module testbench;

    reg [7:0] A;    
    reg [7:0] B;
    wire [7:0] Sum;
    wire CarryOut;

    RCA(
        .A(A),
        .B(B),
        .Sum(Sum),
        .CarryOut(CarryOut)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);

        // Simulación con valores de 8 bits
        A = 8'b10101010;
        B = 8'b11001100;
        #10;

        // Simulación con valores diferentes de 8 bits
        A = 8'b00110011;
        B = 8'b11110000;
        #10;

        // Simulación con otros valores de 8 bits
        A = 8'b01010101;
        B = 8'b01100110;
        #10;

        $finish;
    end

endmodule
