// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sun Mar  3 00:33:16 2024
// Host        : DESKTOP-3B08Q92 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/prisc/TallerDD/laboratorio1-grupo-6/ejercicio2/multiplexor.sim/sim_1/synth/timing/xsim/tb_multiplexor_time_synth.v
// Design      : multiplexor
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* BUS_WIDTH = "8" *) 
(* NotValidForBitStream *)
module multiplexor
   (datos_in_0,
    datos_in_1,
    datos_in_2,
    datos_in_3,
    seleccion,
    dato_out);
  input [7:0]datos_in_0;
  input [7:0]datos_in_1;
  input [7:0]datos_in_2;
  input [7:0]datos_in_3;
  input [1:0]seleccion;
  output [7:0]dato_out;

  wire [7:0]dato_out;
  wire [7:0]dato_out_OBUF;
  wire [7:0]datos_in_0;
  wire [7:0]datos_in_0_IBUF;
  wire [7:0]datos_in_1;
  wire [7:0]datos_in_1_IBUF;
  wire [7:0]datos_in_2;
  wire [7:0]datos_in_2_IBUF;
  wire [7:0]datos_in_3;
  wire [7:0]datos_in_3_IBUF;
  wire [1:0]seleccion;
  wire [1:0]seleccion_IBUF;

initial begin
 $sdf_annotate("tb_multiplexor_time_synth.sdf",,,,"tool_control");
end
  OBUF \dato_out_OBUF[0]_inst 
       (.I(dato_out_OBUF[0]),
        .O(dato_out[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \dato_out_OBUF[0]_inst_i_1 
       (.I0(datos_in_1_IBUF[0]),
        .I1(datos_in_0_IBUF[0]),
        .I2(datos_in_3_IBUF[0]),
        .I3(seleccion_IBUF[1]),
        .I4(seleccion_IBUF[0]),
        .I5(datos_in_2_IBUF[0]),
        .O(dato_out_OBUF[0]));
  OBUF \dato_out_OBUF[1]_inst 
       (.I(dato_out_OBUF[1]),
        .O(dato_out[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \dato_out_OBUF[1]_inst_i_1 
       (.I0(datos_in_1_IBUF[1]),
        .I1(datos_in_0_IBUF[1]),
        .I2(datos_in_3_IBUF[1]),
        .I3(seleccion_IBUF[1]),
        .I4(seleccion_IBUF[0]),
        .I5(datos_in_2_IBUF[1]),
        .O(dato_out_OBUF[1]));
  OBUF \dato_out_OBUF[2]_inst 
       (.I(dato_out_OBUF[2]),
        .O(dato_out[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \dato_out_OBUF[2]_inst_i_1 
       (.I0(datos_in_1_IBUF[2]),
        .I1(datos_in_0_IBUF[2]),
        .I2(datos_in_3_IBUF[2]),
        .I3(seleccion_IBUF[1]),
        .I4(seleccion_IBUF[0]),
        .I5(datos_in_2_IBUF[2]),
        .O(dato_out_OBUF[2]));
  OBUF \dato_out_OBUF[3]_inst 
       (.I(dato_out_OBUF[3]),
        .O(dato_out[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \dato_out_OBUF[3]_inst_i_1 
       (.I0(datos_in_1_IBUF[3]),
        .I1(datos_in_0_IBUF[3]),
        .I2(datos_in_3_IBUF[3]),
        .I3(seleccion_IBUF[1]),
        .I4(seleccion_IBUF[0]),
        .I5(datos_in_2_IBUF[3]),
        .O(dato_out_OBUF[3]));
  OBUF \dato_out_OBUF[4]_inst 
       (.I(dato_out_OBUF[4]),
        .O(dato_out[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \dato_out_OBUF[4]_inst_i_1 
       (.I0(datos_in_1_IBUF[4]),
        .I1(datos_in_0_IBUF[4]),
        .I2(datos_in_3_IBUF[4]),
        .I3(seleccion_IBUF[1]),
        .I4(seleccion_IBUF[0]),
        .I5(datos_in_2_IBUF[4]),
        .O(dato_out_OBUF[4]));
  OBUF \dato_out_OBUF[5]_inst 
       (.I(dato_out_OBUF[5]),
        .O(dato_out[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \dato_out_OBUF[5]_inst_i_1 
       (.I0(datos_in_1_IBUF[5]),
        .I1(datos_in_0_IBUF[5]),
        .I2(datos_in_3_IBUF[5]),
        .I3(seleccion_IBUF[1]),
        .I4(seleccion_IBUF[0]),
        .I5(datos_in_2_IBUF[5]),
        .O(dato_out_OBUF[5]));
  OBUF \dato_out_OBUF[6]_inst 
       (.I(dato_out_OBUF[6]),
        .O(dato_out[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \dato_out_OBUF[6]_inst_i_1 
       (.I0(datos_in_1_IBUF[6]),
        .I1(datos_in_0_IBUF[6]),
        .I2(datos_in_3_IBUF[6]),
        .I3(seleccion_IBUF[1]),
        .I4(seleccion_IBUF[0]),
        .I5(datos_in_2_IBUF[6]),
        .O(dato_out_OBUF[6]));
  OBUF \dato_out_OBUF[7]_inst 
       (.I(dato_out_OBUF[7]),
        .O(dato_out[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \dato_out_OBUF[7]_inst_i_1 
       (.I0(datos_in_1_IBUF[7]),
        .I1(datos_in_0_IBUF[7]),
        .I2(datos_in_3_IBUF[7]),
        .I3(seleccion_IBUF[1]),
        .I4(seleccion_IBUF[0]),
        .I5(datos_in_2_IBUF[7]),
        .O(dato_out_OBUF[7]));
  IBUF \datos_in_0_IBUF[0]_inst 
       (.I(datos_in_0[0]),
        .O(datos_in_0_IBUF[0]));
  IBUF \datos_in_0_IBUF[1]_inst 
       (.I(datos_in_0[1]),
        .O(datos_in_0_IBUF[1]));
  IBUF \datos_in_0_IBUF[2]_inst 
       (.I(datos_in_0[2]),
        .O(datos_in_0_IBUF[2]));
  IBUF \datos_in_0_IBUF[3]_inst 
       (.I(datos_in_0[3]),
        .O(datos_in_0_IBUF[3]));
  IBUF \datos_in_0_IBUF[4]_inst 
       (.I(datos_in_0[4]),
        .O(datos_in_0_IBUF[4]));
  IBUF \datos_in_0_IBUF[5]_inst 
       (.I(datos_in_0[5]),
        .O(datos_in_0_IBUF[5]));
  IBUF \datos_in_0_IBUF[6]_inst 
       (.I(datos_in_0[6]),
        .O(datos_in_0_IBUF[6]));
  IBUF \datos_in_0_IBUF[7]_inst 
       (.I(datos_in_0[7]),
        .O(datos_in_0_IBUF[7]));
  IBUF \datos_in_1_IBUF[0]_inst 
       (.I(datos_in_1[0]),
        .O(datos_in_1_IBUF[0]));
  IBUF \datos_in_1_IBUF[1]_inst 
       (.I(datos_in_1[1]),
        .O(datos_in_1_IBUF[1]));
  IBUF \datos_in_1_IBUF[2]_inst 
       (.I(datos_in_1[2]),
        .O(datos_in_1_IBUF[2]));
  IBUF \datos_in_1_IBUF[3]_inst 
       (.I(datos_in_1[3]),
        .O(datos_in_1_IBUF[3]));
  IBUF \datos_in_1_IBUF[4]_inst 
       (.I(datos_in_1[4]),
        .O(datos_in_1_IBUF[4]));
  IBUF \datos_in_1_IBUF[5]_inst 
       (.I(datos_in_1[5]),
        .O(datos_in_1_IBUF[5]));
  IBUF \datos_in_1_IBUF[6]_inst 
       (.I(datos_in_1[6]),
        .O(datos_in_1_IBUF[6]));
  IBUF \datos_in_1_IBUF[7]_inst 
       (.I(datos_in_1[7]),
        .O(datos_in_1_IBUF[7]));
  IBUF \datos_in_2_IBUF[0]_inst 
       (.I(datos_in_2[0]),
        .O(datos_in_2_IBUF[0]));
  IBUF \datos_in_2_IBUF[1]_inst 
       (.I(datos_in_2[1]),
        .O(datos_in_2_IBUF[1]));
  IBUF \datos_in_2_IBUF[2]_inst 
       (.I(datos_in_2[2]),
        .O(datos_in_2_IBUF[2]));
  IBUF \datos_in_2_IBUF[3]_inst 
       (.I(datos_in_2[3]),
        .O(datos_in_2_IBUF[3]));
  IBUF \datos_in_2_IBUF[4]_inst 
       (.I(datos_in_2[4]),
        .O(datos_in_2_IBUF[4]));
  IBUF \datos_in_2_IBUF[5]_inst 
       (.I(datos_in_2[5]),
        .O(datos_in_2_IBUF[5]));
  IBUF \datos_in_2_IBUF[6]_inst 
       (.I(datos_in_2[6]),
        .O(datos_in_2_IBUF[6]));
  IBUF \datos_in_2_IBUF[7]_inst 
       (.I(datos_in_2[7]),
        .O(datos_in_2_IBUF[7]));
  IBUF \datos_in_3_IBUF[0]_inst 
       (.I(datos_in_3[0]),
        .O(datos_in_3_IBUF[0]));
  IBUF \datos_in_3_IBUF[1]_inst 
       (.I(datos_in_3[1]),
        .O(datos_in_3_IBUF[1]));
  IBUF \datos_in_3_IBUF[2]_inst 
       (.I(datos_in_3[2]),
        .O(datos_in_3_IBUF[2]));
  IBUF \datos_in_3_IBUF[3]_inst 
       (.I(datos_in_3[3]),
        .O(datos_in_3_IBUF[3]));
  IBUF \datos_in_3_IBUF[4]_inst 
       (.I(datos_in_3[4]),
        .O(datos_in_3_IBUF[4]));
  IBUF \datos_in_3_IBUF[5]_inst 
       (.I(datos_in_3[5]),
        .O(datos_in_3_IBUF[5]));
  IBUF \datos_in_3_IBUF[6]_inst 
       (.I(datos_in_3[6]),
        .O(datos_in_3_IBUF[6]));
  IBUF \datos_in_3_IBUF[7]_inst 
       (.I(datos_in_3[7]),
        .O(datos_in_3_IBUF[7]));
  IBUF \seleccion_IBUF[0]_inst 
       (.I(seleccion[0]),
        .O(seleccion_IBUF[0]));
  IBUF \seleccion_IBUF[1]_inst 
       (.I(seleccion[1]),
        .O(seleccion_IBUF[1]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
