`timescale 1ns/1ps

module mux4tb;
    
    // Parámetros de prueba
    parameter NUM_SAMPLES = 50; // Número de datos de prueba

    // Señales de prueba
    logic clk, rst;
    logic [1:0] sel;
    logic [3:0] in0_4, in1_4, in2_4, in3_4, out_4;
    logic [7:0] in0_8, in1_8, in2_8, in3_8, out_8;
    logic [15:0] in0_16, in1_16, in2_16, in3_16, out_16;
    
    // Instancias del DUT (Multiplexor 4:1 para 4, 8 y 16 bits)
    mux4 #(4) uut4 (
        .clk(clk), .rst(rst),
        .in0(in0_4), .in1(in1_4), .in2(in2_4), .in3(in3_4),
        .sel(sel), .out(out_4)
    );

    mux4 #(8) uut8 (
        .clk(clk), .rst(rst),
        .in0(in0_8), .in1(in1_8), .in2(in2_8), .in3(in3_8),
        .sel(sel), .out(out_8)
    );

    mux4 #(16) uut16 (
        .clk(clk), .rst(rst),
        .in0(in0_16), .in1(in1_16), .in2(in2_16), .in3(in3_16),
        .sel(sel), .out(out_16)
    );

    // Generación del reloj (10 ns de período)
    always #5 clk = ~clk;

    // Proceso de prueba
    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0; // Desactiva reset después de 10 ns

        $display("=== Inicio de pruebas ===");

        // Pruebas para cada ancho de datos y cada selección de entrada
        for (sel = 0; sel < 4; sel++) begin
            $display("Probando sel = %b", sel);

            for (int i = 0; i < NUM_SAMPLES; i++) begin
                // Generar datos aleatorios
                in0_4 = $urandom_range(0, 15);
                in1_4 = $urandom_range(0, 15);
                in2_4 = $urandom_range(0, 15);
                in3_4 = $urandom_range(0, 15);

                in0_8 = $urandom_range(0, 255);
                in1_8 = $urandom_range(0, 255);
                in2_8 = $urandom_range(0, 255);
                in3_8 = $urandom_range(0, 255);

                in0_16 = $urandom_range(0, 65535);
                in1_16 = $urandom_range(0, 65535);
                in2_16 = $urandom_range(0, 65535);
                in3_16 = $urandom_range(0, 65535);

                #5; // Esperar 5 ns para estabilizar señales

                // Verificación de salida
                case (sel)
                    2'b00: begin
                        if (out_4 !== in0_4) $display("ERROR 4-bit: esperado=%h, obtenido=%h", in0_4, out_4);
                        if (out_8 !== in0_8) $display("ERROR 8-bit: esperado=%h, obtenido=%h", in0_8, out_8);
                        if (out_16 !== in0_16) $display("ERROR 16-bit: esperado=%h, obtenido=%h", in0_16, out_16);
                    end
                    2'b01: begin
                        if (out_4 !== in1_4) $display("ERROR 4-bit: esperado=%h, obtenido=%h", in1_4, out_4);
                        if (out_8 !== in1_8) $display("ERROR 8-bit: esperado=%h, obtenido=%h", in1_8, out_8);
                        if (out_16 !== in1_16) $display("ERROR 16-bit: esperado=%h, obtenido=%h", in1_16, out_16);
                    end
                    2'b10: begin
                        if (out_4 !== in2_4) $display("ERROR 4-bit: esperado=%h, obtenido=%h", in2_4, out_4);
                        if (out_8 !== in2_8) $display("ERROR 8-bit: esperado=%h, obtenido=%h", in2_8, out_8);
                        if (out_16 !== in2_16) $display("ERROR 16-bit: esperado=%h, obtenido=%h", in2_16, out_16);
                    end
                    2'b11: begin
                        if (out_4 !== in3_4) $display("ERROR 4-bit: esperado=%h, obtenido=%h", in3_4, out_4);
                        if (out_8 !== in3_8) $display("ERROR 8-bit: esperado=%h, obtenido=%h", in3_8, out_8);
                        if (out_16 !== in3_16) $display("ERROR 16-bit: esperado=%h, obtenido=%h", in3_16, out_16);
                    end
                endcase
            end
        end

        $display("=== Pruebas finalizadas ===");
        $stop;
    end

endmodule