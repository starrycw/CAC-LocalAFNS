`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/25 08:09:51
// Design Name: 
// Module Name: FNSadders_6_2
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
module FNSadders_6_2(
    input wire [7:0] f_flag,    //[(x+y-1):0], f_flag[0] is the faulty flag of the first TSV
    output wire [7:0] en_flag,  //[(x+y-1):0]
    output wire [(`FNSLEN_02 - 1) : 0] FNS02,
    output wire [(`FNSLEN_03 - 1) : 0] FNS03,
    output wire [(`FNSLEN_04 - 1) : 0] FNS04,
    output wire [(`FNSLEN_05 - 1) : 0] FNS05,
    output wire [(`FNSLEN_06 - 1) : 0] FNS06,
    
    output wire [(`FNSLEN_07 - 1) : 0] FNS07, 
    output wire [(`FNSLEN_07 - 1) : 0] FNS08
    );
    
     // OUT B
    wire [(`FNSLEN_01 - 1) : 0] B02;
    wire [(`FNSLEN_02 - 1) : 0] B03;
    wire [(`FNSLEN_03 - 1) : 0] B04;
    wire [(`FNSLEN_04 - 1) : 0] B05;
    wire [(`FNSLEN_05 - 1) : 0] B06;
    
    wire [(`FNSLEN_06 - 1) : 0] B07;    
    wire [(`FNSLEN_06 - 1) : 0] B08;
    
    wire [1:0] r_flag;  //Redundant flag, [y-1 : 0]
    
     //Adder_fxx(FNS_n-2_in, FNS_n-1_in, FNS_n_out, FNS_n-1_out, f_flag)
    Adder_f02 adder_02(1'b0, 1'b1, FNS02, B02, f_flag[0]);//0+1=1
    Adder_f03 adder_03(B02, FNS02, FNS03, B03, f_flag[1]);//1+1=2
    Adder_f04 adder_04(B03, FNS03, FNS04, B04, f_flag[2]);//1+2=3
    Adder_f05 adder_05(B04, FNS04, FNS05, B05, f_flag[3]);//2+3=5
    Adder_f06 adder_06(B05, FNS05, FNS06, B06, f_flag[4]);//3+5=8
    
    Adder_f07 adder_07(B06, FNS06, FNS07, B07, f_flag[5]);//5+8=13   
    Adder_f07 adder_08(B07[(`FNSLEN_05 - 1) : 0], FNS07[(`FNSLEN_06 - 1) : 0], FNS08, B08, f_flag[6]);
    
    
    //Get en_flag
    not not_getenableflag[5:0] (en_flag[5:0], f_flag[5:0]);
    
    assign r_flag[0] = FNS07[`FNSLEN_07 - 1] & FNS07[`FNSLEN_07 - 2];
    assign r_flag[1] = FNS08[`FNSLEN_07 - 1] & FNS08[`FNSLEN_07 - 2] | r_flag[0];
    
    assign en_flag[7:6] = ~(f_flag[7:6] | r_flag[1:0]);
endmodule
