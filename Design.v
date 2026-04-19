`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 15:23:54
// Design Name: 
// Module Name: BtGconvertor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
