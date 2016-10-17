//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "decoders.v"
`include "register32zero.v"
`include "register32.v"
`include "mux32to1by32.v"



module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);


	wire[31:0] enables;
	wire RegWrite;
	decoder1to32 decode(enables, RegWrite, WriteRegister);


	wire[31:0] muxInput[31:0];  
	wire WriteData;
	wire Clk;

	register32Zero regisZero(muxInput[0], WriteData, enables[0], Clk);
	
	genvar i;	
	generate 

		for (i = 1; i < 32; i=i+1) begin: createRegister
			register32 regis(muxInput[i], WriteData, enables[i], Clk);
		end

	endgenerate

	

	wire ReadRegister1, ReadRegister2, WriteRegister;

	mux32to1by32 mux32first(ReadData1, ReadRegister1,
		muxInput[0], muxInput[1], muxInput[2], muxInput[3], 
		muxInput[4], muxInput[5], muxInput[6], muxInput[7], 
		muxInput[8], muxInput[9], muxInput[10], muxInput[11], 
		muxInput[12], muxInput[13], muxInput[14], muxInput[15],
		muxInput[16], muxInput[17], muxInput[18], muxInput[19], 
		muxInput[20], muxInput[21], muxInput[22], muxInput[23], 
		muxInput[24], muxInput[25], muxInput[26], muxInput[27], 
		muxInput[28], muxInput[29], muxInput[30], muxInput[31]);

	mux32to1by32 mux32second(ReadData2, ReadRegister2,
		muxInput[0], muxInput[1], muxInput[2], muxInput[3], 
		muxInput[4], muxInput[5], muxInput[6], muxInput[7], 
		muxInput[8], muxInput[9], muxInput[10], muxInput[11], 
		muxInput[12], muxInput[13], muxInput[14], muxInput[15],
		muxInput[16], muxInput[17], muxInput[18], muxInput[19], 
		muxInput[20], muxInput[21], muxInput[22], muxInput[23], 
		muxInput[24], muxInput[25], muxInput[26], muxInput[27], 
		muxInput[28], muxInput[29], muxInput[30], muxInput[31]);

endmodule
