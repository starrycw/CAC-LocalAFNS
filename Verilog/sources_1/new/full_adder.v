`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 15:47:56
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input wire A_in,
    input wire B_in,
    input wire C_in,
    output wire S_out,
    output wire C_out
    );
    
    wire c1, c2, s1;
    
    half_adder ha01(
        .A_in(A_in),
        .B_in(B_in),
        .S_out(s1),
        .C_out(c1)
        );
        
    half_adder ha02(
        .A_in(C_in),
        .B_in(s1),
        .S_out(S_out),
        .C_out(c2)
        );
        
    assign C_out = c1|c2;
    
endmodule
