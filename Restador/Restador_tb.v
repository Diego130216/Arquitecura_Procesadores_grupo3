`include "Restador.v"
`timescale 1ns / 1ps

module Restador_tb();

    reg [4:0] A_tb;    // Minuendo, 5 bits
    reg [4:0] B_tb;    // Sustraendo, 5 bits
  
    wire Cout_tb;
    wire [4:0] res_tb; // Resultado, 5 bits
  
    // Instanciar la Unidad Bajo Prueba (UUT)
    Restador uut (
      .minuendo(A_tb), 
      .sustraendo(B_tb),  
      .C_out(Cout_tb), 
      .restador(res_tb)
    );
  
    initial begin
        // Inicializar A_tb y B_tb
        A_tb = 5'b00001; // Inicializa el minuendo en 1
        
        // Bucle para incrementar A_tb y probar con diferentes valores de B_tb
        for (A_tb = 1; A_tb < 16; A_tb = A_tb + 1) begin
            for (B_tb = 0; B_tb < 15; B_tb = B_tb + 1) begin
                #5; // Esperar 5 unidades de tiempo
                $display("El valor de %d - %d = %d", A_tb, B_tb, res_tb);
            end
        end
        
        $finish;
    end

    initial begin: TEST_CASE
        $dumpfile("restador_tb.vcd");
        $dumpvars(-1, uut);
    end
  
endmodule

  