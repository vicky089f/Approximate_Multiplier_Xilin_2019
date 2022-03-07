`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:50 03/27/2020 
// Design Name: 
// Module Name:    comp_approx_4_2 
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
module comp_approx(
    input X1,
    input X2,
    input X3,
    input X4,
    output Sum,
    output Carry
    );
wire w1,w2,w3,w4,w5,_w1,_w2;

nand g1(w1,X1,X2);
nand g2(w2,X3,X4);
nand g3(Carry,w1,w2);

not g4(_w1,w1);
not g5(_w2,w2);

nand g6(w3,_w1,_w2);

xnor g7(w4,X1,X2);
xnor g8(w5,X3,X4);

nand g9(Sum,w3,w4,w5);

endmodule
