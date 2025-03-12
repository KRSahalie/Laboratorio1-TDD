`timescale 1ns / 1ps


module multiplexor #(parameter BUS_WIDTH = 8)
  (input [BUS_WIDTH-1:0] datos_in_0,
   input [BUS_WIDTH-1:0] datos_in_1,
   input [BUS_WIDTH-1:0] datos_in_2,
   input [BUS_WIDTH-1:0] datos_in_3,
   input [1:0] seleccion,
   output reg [BUS_WIDTH-1:0] dato_out);

  always @*
    case (seleccion)
      2'b00: dato_out = datos_in_0;
      2'b01: dato_out = datos_in_1;
      2'b10: dato_out = datos_in_2;
      2'b11: dato_out = datos_in_3;
      default: dato_out = {BUS_WIDTH{1'bz}}; 
    
    endcase

endmodule