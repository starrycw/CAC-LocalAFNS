`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/25 15:28:01
// Design Name: 
// Module Name: dec_2_2
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
module dec_2_2(
    input wire [3:0] codein,    //[(x+y-1):0]
    output wire [(`BLEN_02 - 1) : 0] dataout,
    input wire [3:0] en_flag,   //[(x+y-1):0]
    
    input wire [(`FNSLEN_02 - 1) : 0] FNS03, 
    input wire [(`FNSLEN_02 - 1) : 0] FNS04

    );
    
    //
    wire [3:0] codein_en;   //[(x+y-1):0]
    and en_gate[3:0] (codein_en, codein, en_flag);
    
    wire mul01;
    wire mul02;
    
    wire [(`FNSLEN_02 - 1) : 0] mul03;   
    wire [(`FNSLEN_02 - 1) : 0] mul04;        
    
    assign dataout = mul01 + mul02 + mul03 + mul04;
    
    assign mul01 = codein_en[0];
    assign mul02 = codein_en[1];
    assign mul03 = (codein_en[2] == 0)? 0 : FNS03;
    assign mul04 = (codein_en[3] == 0)? 0 : FNS04;

endmodule
