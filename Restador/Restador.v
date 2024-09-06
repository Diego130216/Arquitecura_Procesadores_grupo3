`include "sum1b.v"

module restador(
    input[4:0] minuendo, 
    input[4:0] sustraendo,
    output[4:0] restador,
    output C_out
);
    reg [4:0] a2;
    wire c1, c2, c3, c4;
    integer i;
    
    always @(*) begin
        // Calcular el complemento a 1 
        for (i = 0; i <= 4; i = i + 1) begin
            a2[i] = ~sustraendo[i]; // Complemento a 1
        end
        a2 = a2 + 1; // Calcular el complemento a 2
    end

    // Instanciando sumadores de 1 bit
    sum1b s0 (.A(minuendo[0]), .B(a2[0]), .Ci(1'b0),  .Cout(c1), .Sum(restador[0]));
    sum1b s1 (.A(minuendo[1]), .B(a2[1]), .Ci(c1), .Cout(c2), .Sum(restador[1]));
    sum1b s2 (.A(minuendo[2]), .B(a2[2]), .Ci(c2), .Cout(c3), .Sum(restador[2]));
    sum1b s3 (.A(minuendo[3]), .B(a2[3]), .Ci(c3), .Cout(c4), .Sum(restador[3]));
    sum1b s4 (.A(minuendo[4]), .B(a2[4]), .Ci(c4), .Cout(C_out), .Sum(restador[4]));

endmodule
