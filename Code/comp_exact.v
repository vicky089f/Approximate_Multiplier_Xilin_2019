`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:46 03/27/2020 
// Design Name: 
// Module Name:    comp_exact_4-2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module comp_exact(
    input X1,
    input X2,
    input X3,
    input X4,
    input Cin,
    output Sum,
    output Carry,
	 output Cout
    );

wire S;

f_add f1(X1,X2,X3,S,Cout);
f_add f2(S,X4,Cin,Sum,Carry);

endmodule
