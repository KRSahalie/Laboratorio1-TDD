`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 09:48:14 PM
// Design Name: 
// Module Name: RCA
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

module RCA(
 input wire [7:0] A,
 input wire [7:0] B,
 output wire [7:0] Sum,
 output wire CarryOut
);

    wire [7:0] sum_AUX [0:7];
    wire carry_AUX [0:7];

    Bit_Adder bit_adders [7:0](
        .A(A[0]), .B(B[0]), .C(1'b0),
        .suma(sum_AUX[0]), .carry(carry_AUX[0])
    );

    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : gen_adders
            Bit_Adder bit_adder (
                .A(A[i]), .B(B[i]), .C(carry_AUX[i - 1]),
                .suma(sum_AUX[i]), .carry(carry_AUX[i])
            );
        end
    endgenerate

    assign Sum = sum_intermediate;
    assign CarryOut = carry_intermediate[7];

endmodule
