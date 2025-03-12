`timescale 1ns / 10ps

module rca_tb;

   // Parámetros
   parameter n = 8;
    
    // Señales de entrada
    reg [n-1:0] A, B;
    reg Cin;
    
    // Señales de salida
    wire [n:0] S;
    reg [n:0] SUM;
    
    // Instancia del módulo rca
    rca #(.WORD_SIZE(n)) dut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S)
    );
    
      initial begin
    $dumpfile("rca_tb.vcd");
    $dumpvars(0, rca_tb);
  end
  
    // Generación de estímulos
 reg [n:0] i,j,k;
   
 initial begin
  for(i = 0; i < 2**n; i = i + 1) begin
   for (j = 0; j < 2**n ; j = j + 1) begin
    for (k = 0; k < 2; k = k + 1) begin 
          A = i;
          B = j;
          Cin = k;        
          SUM = A + B + Cin;
          #10;
          if (S !== SUM) begin
            $display("Error when A=%d, B=%d, Cin=%d, as S=%d and SUM=%d",i,j,k,S,SUM);
          end
        end
      end
    end
    $finish;
   end
    
endmodule

