//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Student: Kendy Arias
// 
// Create Date: 02/25/2024 04:56:06 PM
// Design Name: Logica del Decodificador parte 2
// Module Name: logica_deco parte 2
// Target Devices: Basys 3 
// Description: Modulo que implementa la logica del decodificador con un multiplexor para poder elegir cual display y cuales entradas estan relacionadas
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module deco_logica(
    input clk,
    input [1:0] btn, // Entradas de los botones designando switches específicos
    input [15:0] sw, // Entradas de los switches
    output reg [0:6] seg, // Salida a los segmentos
    output reg [3:0] an // Salida a los ánodos
);

    reg [3:0] counter; // Selector del multiplexor y anodo
    reg [3:0] digit;

    // Inicialización del contador
    initial begin
        counter = 4'b0000;
    end
    
    always @(*) begin
        // Encender el ánodo respectivo según el valor del contador
        case (counter)
            0: an = 4'b1110;
            1: an = 4'b1101;
            2: an = 4'b1011;
            3: an = 4'b0111;
//            default: an = 4'b0000; // Apagar todos los ánodos si el contador está fuera del rango válido
        endcase
    end

    // Multiplexor
    always @(posedge clk) begin
        case (counter)
            3: digit = sw[15:12];
            2: digit = sw[11:8];
            1: digit = sw[7:4];
            0: digit = sw[3:0];
            default: digit = sw[3:0];
        endcase 
    end

    // 7 segmentos
    always @(posedge clk) begin
        // Decodificar el valor de los switches para los segmentos
        case (digit)
            4'h0: seg = 7'b0000001;
            4'h1: seg = 7'b1001111;
            4'h2: seg = 7'b0010010;
            4'h3: seg = 7'b0000110;
            4'h4: seg = 7'b1001100;
            4'h5: seg = 7'b0100100;
            4'h6: seg = 7'b0100000;
            4'h7: seg = 7'b0001111;
            4'h8: seg = 7'b0000000;
            4'h9: seg = 7'b0000100;
            4'hA: seg = 7'b0001000;
            4'hB: seg = 7'b1100000;
            4'hC: seg = 7'b0110001;
            4'hD: seg = 7'b1000010;
            4'hE: seg = 7'b0110000;
            4'hF: seg = 7'b0111000;
            default: seg = 7'b0000001;  // Default de valor 0
        endcase
    end

    // Lógica para incrementar o decrementar el contador
    always @(*) begin
        // Manejo de los botones
        if (btn[0]) begin // Botón izquierdo presionado
            if (counter < 3) begin
                counter = counter + 1; // Avanzar al siguiente ánodo si no estamos en el límite superior
            end
            else begin
                counter = 0; // Volver al primer ánodo si estamos en el límite superior
            end
        end
        else if (btn[1]) begin // Botón derecho presionado
            if (counter > 0) begin
                counter = counter - 1; // Retroceder al ánodo anterior si no estamos en el límite inferior
            end
            else begin
                counter = 3; // Avanzar al último ánodo si estamos en el límite inferior
            end
        end
end
endmodule
