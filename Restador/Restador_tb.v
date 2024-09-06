`include "Restador.v"
`timescale 1ns/1ns

module Restador_tb();

    reg [4:0] A_tb;   // Cambiado a 5 bits
    reg [4:0] B_tb;   // Cambiado a 5 bits
  
    wire Cout_tb;
    wire [4:0] res_tb; // Cambiado a 5 bits
  
    // Instantiate the Unit Under Test (UUT)
    Restador uut (
      .minuendo(A_tb), 
      .sustraendo(B_tb),  // Cambiado a sustraendo
      .C_out(Cout_tb), 
      .restador(res_tb)
    );
  
  initial begin
    A_tb = 0;
    for (B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
      if (B_tb == 0) begin
        A_tb = A_tb + 1;
      end
      #5 $display("El valor de %d - %d = %d", A_tb, B_tb, res_tb);
    end
    $finish;
  end      

  initial begin: TEST_CASE
    $dumpfile("restador_tb.vcd");
    $dumpvars(-1, uut);
  end
  
endmodule 

  