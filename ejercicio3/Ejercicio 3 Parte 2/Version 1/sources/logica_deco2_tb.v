`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Student: Kendy Arias
// 
// Create Date: 02/25/2024 04:56:06 PM
// Design Name: Logica del Decodificador parte 2
// Module Name: logica_deco2_tb
// Target Devices: Basys 3 
// Description: Modulo para simular señales y probar el modulo
//
//////////////////////////////////////////////////////////////////////////////////

module logica_deco2_tb;

    // Definición de parámetros
    reg [3:0] btn;
    reg [15:0] sw;
    wire [0:6] seg;
    wire [3:0] an;
    wire dp;
    
    // Instancia del módulo bajo prueba
    logica_deco2 dut (
        .btn(btn),
        .sw(sw),
        .seg(seg),
        .an(an),
        .dp(dp)
    );
    
    // Estímulo de entrada
    initial begin
        // Inicializar entradas
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12]= 4'b0000;
        sw[11:8]= 4'b0000;
        sw[7:4]= 4'b0000;  
        sw[3:0]= 4'b0000;  
        
        // Esperar un poco antes de empezar
        #10;
        
        // Cambiar las entradas para simular diferentes condiciones
        // Presionar botón 0 
        //Mapeo 0
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0000;
        #5;
        //Mapeo 1
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0001;
        #5;       
        //Mapeo 2
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0010;
        #5;       
        //Mapeo 3
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0011;
        #5;       
        //Mapeo 4
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0100;
        #5;       
        //Mapeo 5
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0101;
        #5;       
        //Mapeo 6
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0110;
        #5;       
        //Mapeo 7
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0111;
        #5;       
        //Mapeo 8
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b1000;
        #5;     
        //Mapeo 9
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b1001;
        #5;      
        //Mapeo 10
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b1010;
        #5;        
        //Mapeo 11
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b1011;
        #5;       
        //Mapeo 12
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b1100;
        #5;       
        //Mapeo 13
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b1101;
        #5;      
        //Mapeo 14
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b1110;
        #5;       
        //Mapeo 15
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b1111;
        #5;
        
        // Esperar un poco antes de empezar con el otro boton
        #10;
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12]= 4'b0000;
        sw[11:8]= 4'b0000;
        sw[7:4]= 4'b0000;  
        sw[3:0]= 4'b0000;  
        // Cambiar las entradas para simular diferentes condiciones
        // Presionar botón 1 
        //Mapeo 0
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0000;
        #5;
        //Mapeo 1
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0001;
        #5;       
        //Mapeo 2
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0010;
        #5;       
        //Mapeo 3
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0011;
        #5;       
        //Mapeo 4
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0100;
        #5;       
        //Mapeo 5
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0101;
        #5;       
        //Mapeo 6
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0110;
        #5;       
        //Mapeo 7
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0111;
        #5;       
        //Mapeo 8
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b1000;
        #5;     
        //Mapeo 9
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b1001;
        #5;      
        //Mapeo 10
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b1010;
        #5;        
        //Mapeo 11
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b1011;
        #5;       
        //Mapeo 12
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b1100;
        #5;       
        //Mapeo 13
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b1101;
        #5;      
        //Mapeo 14
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b1110;
        #5;       
        //Mapeo 15
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b1111;
        #5;
        
        // Esperar un poco antes de empezar con el otro boton
        #10;
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12]= 4'b0000;
        sw[11:8]= 4'b0000;
        sw[7:4]= 4'b0000;  
        sw[3:0]= 4'b0000;  
        // Cambiar las entradas para simular diferentes condiciones
        // Presionar botón 2
        //Mapeo 0
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b0000;
        #5;
        //Mapeo 1
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b0001;
        #5;      
        //Mapeo 2
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b0010;
        #5;    
        //Mapeo 3
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b0011;
        #5;      
        //Mapeo 4
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b0100;
        #5;    
        //Mapeo 5
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b0101;
        #5;      
        //Mapeo 6
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b0110;
        #5;      
        //Mapeo 7
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b0111;
        #5;       
        //Mapeo 8
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b1000;
        #5;    
        //Mapeo 9
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b1001;
        #5;     
        //Mapeo 10
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b1010;
        #5;     
        //Mapeo 11
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b1011;
        #5;      
        //Mapeo 12
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b1100;
        #5;       
        //Mapeo 13
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b1101;
        #5;     
        //Mapeo 14
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b1110;
        #5;       
        //Mapeo 15
        btn[3]= 0;
        btn[2]= 1;
        btn[1]= 0;
        btn[0]= 0;
        sw[11:8] = 4'b1111;
        #10;
        
        // Esperar un poco antes de empezar con el otro boton
        #10;
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;        
        sw[15:12]= 4'b0000;
        sw[11:8]= 4'b0000;
        sw[7:4]= 4'b0000;  
        sw[3:0]= 4'b0000;  
        // Cambiar las entradas para simular diferentes condiciones
        // Presionar botón 3 
        //Mapeo 0
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0000;
        #5;
        //Mapeo 1
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0001;
        #5;      
        //Mapeo 2
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0010;
        #5;       
        //Mapeo 3
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0011;
        #5;       
        //Mapeo 4
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0100;
        #5;      
        //Mapeo 5
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0101;
        #5;      
        //Mapeo 6
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0110;
        #5;    
        //Mapeo 7
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0111;
        #5;      
        //Mapeo 8
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b1000;
        #5;     
        //Mapeo 9
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b1001;
        #5;      
        //Mapeo 10
         btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b1010;
        #5;      
        //Mapeo 11
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b1011;
        #5;      
        //Mapeo 12
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b1100;
        #5;       
        //Mapeo 13
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b1101;
        #5;     
        //Mapeo 14
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b1110;
        #5;     
        //Mapeo 15
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b1111;
        #5;
        
        
        // Terminar simulación
        $finish;
    end
    
    // Visualización de las salidas
    always @(*) begin
        $display("Botón Pulsado = %b , Display Activo = %b, Valor en Switches = %b, Valor en display= %b (AC)", btn, an, sw, seg);
    end

endmodule
