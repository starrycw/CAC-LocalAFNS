`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 15:28:36
// Design Name: 
// Module Name: adder_f02
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


module Adder_f02(
    //0+1=1,S_out=1,B_out=1; err:S_out=1,B_out=0
    input wire A_in,
    input wire B_in, //f(k-1)
    output wire S_out, //f(k)
    output wire B_out, //f(k-1)
    input wire err_flag //1=error
    );
    wire Sum;
    wire sum_s, b_s;
    wire b_b, a_b;
    wire work_flag;
    
    xor adder01(Sum, A_in, B_in);
    
    
    not not_flag(work_flag, err_flag);
    and en_sum_s01 (sum_s, work_flag, Sum);
    and en_b_s01 (b_s, err_flag, B_in);
    and en_b_b01 (b_b, work_flag, B_in);
    and en_a_b01 (a_b, err_flag, A_in);
    
    or out_s (S_out, sum_s, b_s);
    or out_b (B_out, b_b, a_b);
    
    
endmodule
