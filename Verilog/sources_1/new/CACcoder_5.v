`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/03 07:47:43
// Design Name: 
// Module Name: CACcoder_5
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
module CACcoder_5(
    input wire [(`BLEN_05 - 1) : 0] datain,
    input wire clock,
    output reg [4:0] codeout,   //[x-1 : 0]
    
    input wire [`FNSLEN_02-1 : 0] FNS02,
    input wire [`FNSLEN_03-1 : 0] FNS03,
    input wire [`FNSLEN_04-1 : 0] FNS04,
    input wire [`FNSLEN_05-1 : 0] FNS05
    );
    
    //define r
    wire [`FNSLEN_06-1 : 0] r_05;
    wire [`FNSLEN_05-1 : 0] r_04;
    wire [`FNSLEN_04-1 : 0] r_03;
    
    //define output wire
    wire [4:0] codeout_wire;    //[x-1 : 0]
    
    //calc r
    assign r_05 = (codeout_wire[4] == 0) ? (datain) : (datain - FNS05);
    assign r_04 = (codeout_wire[3] == 0) ? (r_05) : (r_05 - FNS04);
    assign r_03 = (codeout_wire[2] == 0) ? (r_04) : (r_04 - FNS03);
    assign codeout_wire[0] = (codeout_wire[1] == 0) ? (r_03) : (r_03 - FNS02);
    
    //coding
    assign codeout_wire[4] = (datain < FNS05) ? 0 : 1;
    assign codeout_wire[3] = (r_05 < FNS05) ? 0 : 1;
    assign codeout_wire[2] = (r_04 < FNS03) ? 0 : 1;
    assign codeout_wire[1] = (r_03 < FNS03) ? 0 : 1; 
    
    //sync
    always @(posedge clock) begin
      codeout <= codeout_wire;
    end
endmodule
