`timescale 1ns / 1ps

module BtGconvertor(
   input [3:0]a_i,
   output [3:0]b_o 
);

//Behavioural Representation
//assign b_o = a_i ^ (a_i >> 1); //behavioural modelling
assign b_o[3] = a_i[3]; //dataflow modelling
assign b_o[2] = a_i[2] ^ a_i[3];
assign b_o[1] = a_i[1] ^ a_i[2];
assign b_o[0] = a_i[0] ^ a_i[1];

endmodule
