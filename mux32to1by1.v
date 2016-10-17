module mux32to1by1
(
output      out,
input[4:0]  address,
input[31:0] inputs
);
  
	wire[31:0]  inputsofmux;
	wire[4:0] address;
	
	assign out=inputsofmux[address];

endmodule