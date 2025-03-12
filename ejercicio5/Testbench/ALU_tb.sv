`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.02.2024 23:43:01
// Design Name: 
// Module Name: ALU_tb
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


module tb_module_ALU #(parameter N = 4);

    logic [N-1:0]    A; //Entada A de la Alu
    logic [N-1:0]    B; //Entrada B de la ALU
    
    logic [3:0]      alucont; //entrada de control de la ALU
    logic            flagin;// entrada de la flag de entrada
    
    logic [N-1:0]   aluresult;// salida de la ALU
    logic           flagout;// salida de la flag
    logic           flagz;// salida de la bandera z
    
    module_ALU dut (
    
    .A_i (A),
    .B_i (B),
    .alucont_i(alucont),
    .flagin_i(flagin),
    .aluresult_o(aluresult),
    .flagz_o(flagz),
    .flagout_o(flagout)
    
    );
    
    initial begin
         
         
         A= 4'b0000; //A= 0h
         B= 4'b0000; //b= 0h
         flagin = 4'b0000;
   
//         #10
   
         //test numero 1
         alucont = 4'b0000; // 0h Operacion AND
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
//         flagin = $urandom_range(4'b0000, 4'b0001);
    
         #10

          //test numero 2
         alucont = 4'b0001; //1h Operacion OR
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
//        flagin = $urandom_range(4'b0000, 4'b0001);
    
         #10  
    
         //test numero 3
         alucont = 4'b0010; //2h Suma
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10   

          //test numero 4
         alucont = 4'b0011; //3h Incrementar
         #10

         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10     

    
         //test numero 5
         alucont = 4'b0100; //4h Operacion decrementar
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10    

      
         //test numero 6
         alucont = 4'b0101; //5h NOT 
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10   
   
    
         //test numero 7
         alucont = 4'b0110; //6h Resta
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10 
            
         //test numero 8
         alucont = 4'b0111; //7h XOR
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
    
         #10 
       
         //test numero 9
         alucont = 4'b1000; //8h Corrimiento hacia la izquierda
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
    
         #10 
     
         //test numero 10
         alucont = 4'b1001; //9h Corrimiento a la derecha
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);    
         
         #10
           
         $finish;
    
      end 
 
endmodule
    

    

