`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.02.2024 23:40:25
// Design Name: 
// Module Name: ALU
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


module module_ALU #(parameter N = 4)// se crea una parametrizacion del modulo ALU
(
    
    input logic [N-1:0]    A_i, //Entada del operando A 
    input logic [N-1:0]    B_i, //Entrada del operando B 
    
    input logic [3:0]      alucont_i, //Entrada de control 
    input logic            flagin_i,// Entrada del carry de entrada
    
    output logic [N-1:0]   aluresult_o,// Salida del resultado
    output logic           flagout_o,// Salida del carry de salida
    output logic           flagz_o// Salida de la bandera z
  
);
    

    
    
    always_comb begin // se Hace el bloque always_comb para describir la lógica combinacional del módulo
            case(alucont_i)// se usa la funcion case para cambiar entre las funciones de la ALU. alucont_i determinar que operación realizar.
            
            //Descripción de las operaciones
              
                              
                4'b0000: begin //1h AND
                
                   aluresult_o = A_i & B_i; //Operacion AND
                   flagout_o = 0;
                    
                end
                
                4'b0001: begin //0h OR 
                
                    aluresult_o = A_i | B_i; //Operacion OR
                    flagout_o = 0;
                   
                end

                            
                4'b0010: begin //2h SUMA (complemento 2)
                    
                    logic [N:0] suma; //Bus para el resultado suma
                    logic  overflow_s; //Variable de desbordamiento
                    logic [N-1:0] A_cin; // Variable para el carry del operando A
                    
                    A_cin = A_i + flagin_i; //Suma del operando A y la bandera de entrada
                    /* En la variable A_cin se utiliza para incluir cualquier acarreo entre el operando
                    y la bandera de entrada*/
                    
                    suma = A_cin + B_i; //Operacion de la suma y resta
                    flagout_o = suma[N]; // acarreo de salida
                    
                    overflow_s = ((~(A_cin[N-1])) & (~(B_i[N-1])) & suma[N-1]) | ((A_cin[N-1]) & (B_i[N-1]) & (~(suma[N-1])));                 
                 
                    aluresult_o = suma; //Resultado de la suma, se asigna a la salida
                           
                end   
                
                4'b0011: begin //3h Incrementa en un operando
                    if (flagin_i == 0) begin //Si flagin_i es 0 se incrementa en uno el operando A
                        aluresult_o = A_i + 1; //Operacion para incrementar en 1 el operando A
                    end else begin  //Si falgin:i es 1 se incrementa en uno el operando B
                        aluresult_o = B_i + 1;  //Incremento en 1 para el operando B
                    end
                end

                4'b0100: begin //4h Decrementa en un operando
                    if (flagin_i == 0) begin //Si flagin_i es 0 se decrementa en uno el operando A
                        aluresult_o = A_i - 1;  //Decremento en 1 para el operando A
                    end else begin  //Si falgin:i es 1 se decrementa en uno el operando B
                        aluresult_o = B_i - 1; //Decremento en 1 para el operando B
                    end
                end                
                
                4'b0101: begin //5h NOT (Sobre un operando)
                    logic [N-1:0] neg_op;
                    
                    if (flagin_i == 0) begin  //Si flagin_i es 0, se niega el operando A_i
                        neg_op = ~A_i;
                        aluresult_o = neg_op;  // Asigna neg_op a la salida
                    end else begin   //Si flagin_i es 1, se niega el operando B_i
                        neg_op = ~B_i;
                        aluresult_o = neg_op;  // Asigna neg_op a la salida
                    end
                end
                
                
                4'b0110: begin //6h RESTA (complemento 2)
                
                   logic [N:0] resta; //Variable para el resultado de la resta
                   logic overflow_r; //Variable para determinar el desbordamiento deurante la resta
                   logic [N-1:0]B_resta; //Variable para almacenar el complemento a 2 de la entrada de B_in
                   logic [N-1:0] A_cin; //Variable para el acarreo de la bandera flagin_i
                   
                   A_cin = A_i + flagin_i; //Suma del operando A y la bandera de entrada
                   B_resta = B_i * -1; //Complemento a 2 de B_i (Inversión de bits de B_i y sumando 1 al resultado)
                   resta = A_cin + B_resta; //Resta 
                   flagout_o = resta[N]; //Acarreo de salida 
                   overflow_r = ((~(A_i[N-1])) & (~(B_resta[N-1])) & resta[N-1]) | ((A_i[N-1]) & (B_resta[N-1]) & (~(resta[N-1])));
                   
                   aluresult_o = resta; //Resultado de la resta, se asigna a la salida
        
                end

                
                4'b0111: begin //7h XOR
                  
                    aluresult_o = A_i ^ B_i;  //Operacion XOR
                       
                end
                
                //Para el corrimiento solo toma los 0 y 1
                
                4'b1000: begin //8h corrimiento logico a la izquierda del operando A (correr B bits)
                
                    logic [N:0] shifted_r; //Variable para el resultado de corrimiento
                    
                     shifted_r = A_i << B_i;   //Corrimiento hacia la izquierda
                     flagout_o = A_i[N-1];     //Actualizacion de la bandera de desbordamiento si es necesario
                     aluresult_o = shifted_r[N-1:0];  //Se asigna el resultado al puesto de salida
                    
                end
                
                4'b1001: begin //9h corrimiento logico a la derecha del operando A (correr B bits)
                    aluresult_o = A_i >> B_i; //Corrimiento logico hacia la derecha
                    flagout_o =  A_i[N-1]; //Actualizacion de la bandera de salida con el bit que sale por el lado derecho despues del corrimiento
                end
                
                default: begin //Se usa el default para los casos que no se consideran en el codigo
                    
                end
            endcase
            
            // Condicionea para la bandera Z
        
             if (aluresult_o == 0)begin
	                               
 	             flagz_o = 1;
	         end else 
	            
	            flagz_o = 0;
             end

endmodule
