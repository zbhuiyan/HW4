`include "register.v"

module register32
(
output[31:0]  q,
input[31:0]   d,
input       wrenable,
input       clk
);
   
   wire wrenable;
   wire clk;
   wire[31:0] d;



   genvar i;	
   generate 
		for (i=0; i < 32; i=i+1) begin: createRegister
			register regis(q[i], d[i], wrenable, clk);
		end
   endgenerate

endmodule