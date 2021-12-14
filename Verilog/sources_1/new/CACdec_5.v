`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/03 07:47:43
// Design Name: 
// Module Name: CACdec_5
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

`include "Fibo.vh"
module CACdec_5(
    input wire [4:0] codein,    //[x-1 : 0]
    output wire [`BLEN_05-1 : 0] dataout,
    
    input wire [`FNSLEN_03-1 : 0] FNS03,
    input wire [`FNSLEN_04-1 : 0] FNS04,
    input wire [`FNSLEN_05-1 : 0] FNS05
    );
    
    wire [`FNSLEN_05-1 : 0] s_05;
    wire [`FNSLEN_04-1 : 0] s_04; 
    wire [`FNSLEN_03-1 : 0] s_03;
    wire s_02;
    wire s_01;
    
    //sum
    assign s_05 = (codein[4] == 0) ? 0 : FNS05;
    assign s_04 = (codein[3] == 0) ? 0 : FNS04;
    assign s_03 = (codein[2] == 0) ? 0 : FNS03;
    assign s_02 = (codein[1] == 0) ? 0 : 1;
    assign s_01 = (codein[0] == 0) ? 0 : 1;
    
    assign dataout = s_01 + s_02 + s_03 + s_04 + s_05;
endmodule
