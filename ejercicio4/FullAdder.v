`timescale 1ns / 1ps
module FullAdder(
    input a, b, cin,    // Entradas de un 1 bit del sumador completo
    output s, cout    // Salida de un 1 bit de la suma y acarreo
);
// Definición de la suma y el acarreo mediante compuertas lógicas
assign s = a ^ b ^ cin;
assign cout = (a & b) | (a & cin) | (b & cin);

endmodule