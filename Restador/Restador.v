`include "sum4b.v"

module Restador(
    input [3:0] A, 
    input [3:0] B,
    output [3:0] restador,
    input  sel,
    output C_out
);
    reg [3:0] resul;
    integer i;
    always @(*) begin  
        for (i = 0; i < 4; i = i + 1) begin
            resul[i] = B[i] ^ sel;
        end
    end

    sum4b S (.A(A), .B(resul), .Ci(sel), .Cout(C_out), .Sum(restador)); 
    
endmodule