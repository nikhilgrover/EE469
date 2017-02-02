/* 
EE 469 Project 3
Ishana Sharma, Harry Cheng, Nikhil Grover

This module represents a 32-bit adder, composed
of two 16-bit adders, which are made of
four 4-bit adders. This module follows dataflow
level modeling
*/

module adder32(sum, carryOut, overflow, inA, inB, carryIn);
	output [31:0] sum;
	output carryOut, overflow;
	input [31:0] inA, inB;
	input carryIn;

	//propogate, generate and carry, these wires are 
	//passed between the adder modules

	wire [1:0] prop, gen, carry;
	wire lowerOverflow;

	assign carry[0] = carryIn;

	adder16 adder16_0 (sum[15:0], carry[1], lowerOverflow, inA[15:0], inB[15:0], carry[0]);
	adder16 adder16_1 (sum[31:16], carryOut, overflow, inA[31:16], inB[31:16], carry[1]);


endmodule

//16-bit adder
module adder16(sum, carryOut, largeOverflow, inA, inB, carryIn);
	output [15:0] sum;
	output carryOut;
	output largeOverflow;
	input [15:0] inA, inB;
	input carryIn;

	wire [3:0] prop, gen, carry;
	wire [3:0] unitOverflows;

	//Most significant bit's overflow gets 
	//passed to the uper module
	assign largeOverflow = unitOverflows[3];
	assign carry[0] = carryIn;

	adder4 adder4_0 (sum[3:0], carry[1], unitOverflows[0], inA[3:0], inB[3:0], carry[0]);
	adder4 adder4_1 (sum[7:4], carry[2], unitOverflows[1], inA[7:4], inB[7:4], carry[1]);
	adder4 adder4_2 (sum[11:8], carry[3], unitOverflows[2], inA[11:8], inB[11:8], carry[2]);
	adder4 adder4_3 (sum[15:12], carryOut, unitOverflows[3], inA[15:12], inB[15:12], carry[3]);

endmodule

module adder4(sum, carryOut, unitOverflow, inA, inB, carryIn);
	output [3:0] sum;
	output carryOut;
	output unitOverflow;
	input [3:0] inA, inB;
	input carryIn;

	wire [3:0] prop, gen, carry;

	assign unitOverflow = carryOut ^ carry[3];
	assign prop = inA ^ inB;
	assign gen = inA & inB;

	//Compute carry function
	assign carry[0] = carryIn;
	assign carry[1] = gen[0] | (prop[0] & carry[0]);
	assign carry[2] = gen[1] | (gen[0] & prop[1]) | (carry[0] & prop[0] & prop[1]);
	assign carry[3] = gen[2] | (gen[1] & prop[2]) | (carry[0] & prop[0] & prop[1] & prop[2]);
	assign carryOut = gen[3] | (gen[2] & prop[3]) | (gen[1] & prop[3] & prop[2]) | (gen[0] & prop[3] & prop[2] & prop[1]) | (prop[0] & prop[1] & prop[2] & prop[3] & carry[0]);

	//Calculate sum
	assign sum = prop ^ carry;

endmodule