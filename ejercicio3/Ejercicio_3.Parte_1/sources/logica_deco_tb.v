`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Student: Kendy Arias
// 
// Create Date: 02/25/2024 04:56:06 PM
// Design Name: TB de Logica del Decodificador parte 1
// Module Name: logica_deco_tb
// Target Devices: Basys 3 
// Description: Modulo para simular el funcionamiento de la logica 
//
//////////////////////////////////////////////////////////////////////////////////
module logica_deco_tb;

    // Definición de señales
    reg [3:0] valor;                   // Entrada
    wire [0:6] representacion;        // Salida
    
    // Instancia del módulo bajo prueba
    logica_deco DUT (
        .valor(valor),               // Conexión de la señal de entrada
        .representacion(representacion) // Conexión de la señal de salida
    );
    // Generación de estímulos
    initial begin
        // Inicializar valores
        valor = 4'b0000; // Ejemplo de entrada inicial
        #10; // Espera 10 unidades de tiempo
    
        // Cambiar la entrada y observar la salida
        valor = 4'b0001; // Cambiar la entrada a 1
        #10;             // Esperar un ciclo de reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b0010; // Cambiar la entrada a 2
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b0011; // Cambiar la entrada a 3
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b0100; // Cambiar la entrada a 4
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b0101; // Cambiar la entrada a 5
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b0110; // Cambiar la entrada a 6
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b0111; // Cambiar la entrada a 7
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b1000; // Cambiar la entrada a 8
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b1001; // Cambiar la entrada a 9
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b1010; // Cambiar la entrada a 10
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b1011; // Cambiar la entrada a 11
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b1100; // Cambiar la entrada a 12
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b1101; // Cambiar la entrada a 13
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b1110; // Cambiar la entrada a 14
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b1111; // Cambiar la entrada a 15
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        // Terminar la simulación
        $finish;
    end

endmodule
