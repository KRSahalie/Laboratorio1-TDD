`timescale 1ns / 1ps

module tb_multiplexor #(parameter ANCHO = 8) ();
    reg   [ANCHO-1:0]   data_0_i, data_1_i, data_2_i, data_3_i;  
    reg   [1:0]         select;
    wire   [ANCHO-1:0]   data_o;
    integer i;
    
    multiplexor #(ANCHO) dut(data_0_i, data_1_i, data_2_i, data_3_i, select, data_o);
        
    initial begin
    $display("Empezando simulaci�n para un ancho de: %d", ANCHO);
   
    for (i = 0; i < 50; i=i+1) begin
        data_0_i = $random;
        data_1_i = $random;
        data_2_i = $random;
        data_3_i = $random;


        select = 2'b00; // Se pone la se�al de selecci�n en 00
        #5; // Esperar 10 unidades de tiempo        

        // Verificar que data_o y data_0_i son iguales 
        if (data_o != data_0_i) begin
            $display("Error en iteraci�n %0d: El valor a la entrada es %b y el obtenido a la salida fue %b, no son iguales", i, data_0_i, data_o);
            $finish;
        end
        //$display("Iteraci�n %0d: Verificaci�n 1 pasada", i);

        select = 2'b01; // Se pone la se�al de selecci�n en 01
        #5; 

        // Verificar que data_o y data_1_i son iguales 
        if (data_o != data_1_i) begin
            $display("Error en iteraci�n %0d: El valor a la entrada es %b y el obtenido a la salida fue %b, no son iguales", i, data_1_i, data_o);
            $finish;
        end
        //$display("Iteraci�n %0d: Verificaci�n 2 pasada", i);

        select = 2'b10; // Se pone la se�al de selecci�n en 10
        #5; 

        // Verificar que data_o y data_2_i son iguales 
        if (data_o != data_2_i) begin
            $display("Error en iteraci�n %0d: El valor a la entrada es %b y el obtenido a la salida fue %b, no son iguales", i, data_2_i, data_o);
            $finish;
        end
        //$display("Iteraci�n %0d: Verificaci�n 3 pasada", i);

        select = 2'b11; // Se pone la se�al de selecci�n en 11
        #5; 

        // Verificar que data_o y data_3_i son iguales 
        if (data_o != data_3_i) begin
            $display("Error en iteraci�n %0d: El valor a la entrada es %b y el obtenido a la salida fue %b, no son iguales", i, data_3_i, data_o);
            $finish;
        end
        //$display("Iteraci�n %0d: Verificaci�n 4 pasada", i);
    end

    // Si la simulaci�n llega aqu�, es porque se complet� correctamente
    $display("Simulaci�n terminada correctamente para un ancho de: %d", ANCHO);
    //$finish;
end

endmodule

// M�dulo que envuelve el test bench para cambiar el valor de ANCHO
module tb_wrapper;
    tb_multiplexor #(4) tb_4();
    tb_multiplexor #(8) tb_8();
    tb_multiplexor #(16) tb_16();
endmodule

