`include "sum1b.v"

module restador(
    input[4:0] minuendo, 
    input[4:0] sustraendo,
    input [7:0] a2,
    output[4:0] restador
);

wire c1,c2,c3,c4;

always(*) begin
   for ( i= 0 ; i<=4 ; i++) begin
        if (sustraendo[i]=1)begin
            a2[i]=0;
        end
        else begin
            a2[i]=1;
        end
    
   end 

end






endmodule