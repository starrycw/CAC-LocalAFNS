`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/25 08:09:51
// Design Name: 
// Module Name: FNSadders_2_2
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
module FNSadders_2_2(
    input wire [3:0] f_flag,    //[(x+y-1):0], f_flag[0] is the faulty flag of the first TSV
    output wire [3:0] en_flag,  //[(x+y-1):0]
    output wire [(`FNSLEN_02 - 1) : 0] FNS02,
    
    output wire [(`FNSLEN_03 - 1) : 0] FNS03,   
    output wire [(`FNSLEN_03 - 1) : 0] FNS04

    );
    
     // OUT B
    wire [(`FNSLEN_01 - 1) : 0] B02;
    
    wire [(`FNSLEN_02 - 1) : 0] B03; 
    wire [(`FNSLEN_02 - 1) : 0] B04; 

    
    wire [1:0] r_flag;  //Redundant flag, [y-1 : 0]
    
     //Adder_fxx(FNS_n-2_in, FNS_n-1_in, FNS_n_out, FNS_n-1_out, f_flag)
    Adder_f02 adder_02(1'b0, 1'b1, FNS02, B02, f_flag[0]);//0+1=1
    
    Adder_f03 adder_03(B02, FNS02, FNS03, B03, f_flag[1]);//1+1=2    
    Adder_f03 adder_04(B03[(`FNSLEN_01 - 1) : 0], FNS03[(`FNSLEN_02 - 1) : 0], FNS04, B04, f_flag[2]);//1+2=3  
    
    
    //Get en_flag
    not not_getenableflag[1:0] (en_flag[1:0], f_flag[1:0]);
    
    assign r_flag[0] = FNS03[`FNSLEN_03 - 1];
    assign r_flag[1] = FNS04[`FNSLEN_03 - 1] | r_flag[0];
    
    assign en_flag[3:2] = ~(f_flag[3:2] | r_flag[1:0]);
 
endmodule
