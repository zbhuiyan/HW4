module register32Zero
(
output[31:0]   q,
input[31:0]    d,
input       wrenable,
input       clk
);
    
    assign q = 32'b0; //don't have to worry about clk
     
endmodule