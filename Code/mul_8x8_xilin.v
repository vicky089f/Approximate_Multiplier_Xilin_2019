`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:13 03/27/2020 
// Design Name: 
// Module Name:    mul_8x8_comp 
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
module mul_8x8_xilin(
    input [7:0] A,
    input [7:0] B,
    output [15:0] P,
    wire [7:0] PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8,
    wire [12:4] R1,
    wire [11:5] R2,
    wire [10:6] R3,
    wire [9:7] R4,
    wire [11:9] C1,
    wire [13:9] C2,
    wire [14:2] C3,
    wire [13:2] F1,
    wire [14:3] F2
    );

//Generating 8 partial product rows
and g1[7:0](PP1,A,B[0]);
and g2[7:0](PP2,A,B[1]);
and g3[7:0](PP3,A,B[2]);
and g4[7:0](PP4,A,B[3]);
and g5[7:0](PP5,A,B[4]);
and g6[7:0](PP6,A,B[5]);
and g7[7:0](PP7,A,B[6]);
and g8[7:0](PP8,A,B[7]);

//Reduction Stage 1
//Approximate Section
h_add h1(PP1[4],PP2[3],R1[4],R2[5]);
comp_approx c1(PP1[5],PP2[4],PP3[3],PP4[2],R1[5],R3[6]);
comp_approx c2(PP1[6],PP2[5],PP3[4],PP4[3],R1[6],R3[7]);
h_add h2(PP5[2],PP6[1],R2[6],R4[7]);
comp_approx c3(PP1[7],PP2[6],PP3[5],PP4[4],R1[7],R3[8]);
comp_approx c4(PP5[3],PP6[2],PP7[1],PP8[0],R2[7],R4[8]);

//Exact Section
comp_exact c5(PP2[7],PP3[6],PP4[5],PP5[4],1'b0,R1[8],R3[9],C1[9]);
f_add f1(PP6[3],PP7[2],PP8[1],R2[8],R4[9]);
comp_exact c6(PP3[7],PP4[6],PP5[5],PP6[4],C1[9],R1[9],R2[10],C1[10]);
h_add h3(PP7[3],PP8[2],R2[9],R3[10]);
comp_exact c7(PP4[7],PP5[6],PP6[5],PP7[4],C1[10],R1[10],R2[11],C1[11]);
f_add f2(PP5[7],PP6[6],C1[11],R1[11],R1[12]);

//Reduction Stage 2
//Approximate Section
h_add h4(PP1[2],PP2[1],F1[2],F2[3]);
comp_approx c8(PP1[3],PP2[2],PP3[1],PP4[0],F1[3],F2[4]);
comp_approx c9(R1[4],PP3[2],PP4[1],PP5[0],F1[4],F2[5]);
comp_approx c10(R1[5],R2[5],PP5[1],PP6[0],F1[5],F2[6]);
comp_approx c11(R1[6],R2[6],R3[6],PP7[0],F1[6],F2[7]);
comp_approx c12(R1[7],R2[7],R3[7],R4[7],F1[7],F2[8]);

//Exact Section
comp_exact c13(R1[8],R2[8],R3[8],R4[8],1'b0,F1[8],F2[9],C2[9]);
comp_exact c14(R1[9],R2[9],R3[9],R4[9],C2[9],F1[9],F2[10],C2[10]);
comp_exact c15(R1[10],R2[10],R3[10],PP8[3],C2[10],F1[10],F2[11],C2[11]);
comp_exact c16(R1[11],R2[11],PP7[5],PP8[4],C2[11],F1[11],F2[12],C2[12]);
comp_exact c17(R1[12],PP6[7],PP7[6],PP8[5],C2[12],F1[12],F2[13],C2[13]);
f_add f3(PP7[7],PP8[6],C2[13],F1[13],F2[14]);

//Final Product Generation
buf b(P[0],PP1[0]);
h_add h5(PP1[1],PP2[0],P[1],C3[2]);
f_add f4(F1[2],PP3[0],C3[2],P[2],C3[3]);
f_add f5(F1[3],F2[3],C3[3],P[3],C3[4]);
f_add f6(F1[4],F2[4],C3[4],P[4],C3[5]);
f_add f7(F1[5],F2[5],C3[5],P[5],C3[6]);
f_add f8(F1[6],F2[6],C3[6],P[6],C3[7]);
f_add f9(F1[7],F2[7],C3[7],P[7],C3[8]);
f_add f10(F1[8],F2[8],C3[8],P[8],C3[9]);
f_add f11(F1[9],F2[9],C3[9],P[9],C3[10]);
f_add f12(F1[10],F2[10],C3[10],P[10],C3[11]);
f_add f13(F1[11],F2[11],C3[11],P[11],C3[12]);
f_add f14(F1[12],F2[12],C3[12],P[12],C3[13]);
f_add f15(F1[13],F2[13],C3[13],P[13],C3[14]);
f_add f16(PP8[7],F2[14],C3[14],P[14],P[15]);

endmodule