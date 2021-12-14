`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 15:47:56
// Design Name: 
// Module Name: half_adder
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


module half_adder(
    input wire A_in,
    input wire B_in,
    output wire S_out,
    output wire C_out
    );
    
    assign S_out = A_in ^ B_in;
    assign C_out = A_in & B_in;
    
endmodule
