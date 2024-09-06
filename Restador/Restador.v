`include "sum1b.v"

module restador(
    input[4:0] minuendo, 
    input[4:0] sustraendo,
    output[4:0] restador
);
reg [4:0] a2;
wire c1,c2,c3,c4;
integer i; 
always(*) begin
    //calcular el cpmplemento a 1 
   for ( i= 0 ; i<=4 ; i++) begin
        if (sustraendo[i]==1)begin
            a2[i]=0;
        end
        else begin
            a2[i]=1;
        end    
   end 
  
end

a2=a2+1;




endmodule