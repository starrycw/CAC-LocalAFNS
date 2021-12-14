`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/25 15:28:01
// Design Name: 
// Module Name: dec_6_3
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
module dec_6_3(
    input wire [8:0] codein,    //[(x+y-1):0]
    output wire [(`BLEN_06 - 1) : 0] dataout,
    input wire [8:0] en_flag,   //[(x+y-1):0]
    
    input wire [(`FNSLEN_03 - 1) : 0] FNS03,
    input wire [(`FNSLEN_04 - 1) : 0] FNS04,
    input wire [(`FNSLEN_05 - 1) : 0] FNS05,
    input wire [(`FNSLEN_06 - 1) : 0] FNS06,
    
    input wire [(`FNSLEN_06 - 1) : 0] FNS07,
    input wire [(`FNSLEN_06 - 1) : 0] FNS08,
    input wire [(`FNSLEN_06 - 1) : 0] FNS09

    );
    
    //
    wire [8:0] codein_en;   //[(x+y-1):0]
    and en_gate[8:0] (codein_en, codein, en_flag);
    
    wire mul01;
    wire mul02;
    wire [(`FNSLEN_03 - 1) : 0] mul03;
    wire [(`FNSLEN_04 - 1) : 0] mul04;
    wire [(`FNSLEN_05 - 1) : 0] mul05;
    wire [(`FNSLEN_06 - 1) : 0] mul06;
    
    wire [(`FNSLEN_06 - 1) : 0] mul07;
    wire [(`FNSLEN_06 - 1) : 0] mul08;
    wire [(`FNSLEN_06 - 1) : 0] mul09;
    
    assign dataout = mul01 + mul02 + mul03 + mul04 + mul05 + mul06 + mul07 + mul08 + mul09;
    
    assign mul01 = codein_en[0];
    assign mul02 = codein_en[1];
    assign mul03 = (codein_en[2] == 0)? 0 : FNS03;
    assign mul04 = (codein_en[3] == 0)? 0 : FNS04;
    assign mul05 = (codein_en[4] == 0)? 0 : FNS05;
    assign mul06 = (codein_en[5] == 0)? 0 : FNS06;
    assign mul07 = (codein_en[6] == 0)? 0 : FNS07;
    assign mul08 = (codein_en[7] == 0)? 0 : FNS08;
    assign mul09 = (codein_en[8] == 0)? 0 : FNS09; 
    
endmodule
