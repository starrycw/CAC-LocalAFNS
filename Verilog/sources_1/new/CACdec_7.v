`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/03 07:47:43
// Design Name: 
// Module Name: CACdec_7
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
module CACdec_7(
    input wire [6:0] codein,    //[x-1 : 0]
    output wire [`BLEN_07-1 : 0] dataout,
    
    input wire [`FNSLEN_03-1 : 0] FNS03,
    input wire [`FNSLEN_04-1 : 0] FNS04,
    input wire [`FNSLEN_05-1 : 0] FNS05,
    input wire [`FNSLEN_06-1 : 0] FNS06,
    input wire [`FNSLEN_07-1 : 0] FNS07
    );
    
    wire [`FNSLEN_07-1 : 0] s_07;
    wire [`FNSLEN_06-1 : 0] s_06;
    wire [`FNSLEN_05-1 : 0] s_05;
    wire [`FNSLEN_04-1 : 0] s_04; 
    wire [`FNSLEN_03-1 : 0] s_03;
    wire s_02;
    wire s_01;
    
    //sum
    assign s_07 = (codein[6] == 0) ? 0 : FNS07;
    assign s_06 = (codein[5] == 0) ? 0 : FNS06;
    assign s_05 = (codein[4] == 0) ? 0 : FNS05;
    assign s_04 = (codein[3] == 0) ? 0 : FNS04;
    assign s_03 = (codein[2] == 0) ? 0 : FNS03;
    assign s_02 = (codein[1] == 0) ? 0 : 1;
    assign s_01 = (codein[0] == 0) ? 0 : 1;
    
    assign dataout = s_01 + s_02 + s_03 + s_04 + s_05 + s_06 + s_07;
endmodule
