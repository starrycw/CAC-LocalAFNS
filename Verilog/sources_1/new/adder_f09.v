`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 15:28:36
// Design Name: 
// Module Name: adder_f09
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

module Adder_f09(
    //4,5,6
    input wire [3:0] A_in, //f(k-2)
    input wire [4:0] B_in, //f(k-1)
    output wire [5:0] S_out, //f(k)
    output wire [4:0] B_out, //f(k-1)
    input wire err_flag //1=error
    );
    wire [5:0] Sum;
    wire c[3:0];
    wire [5:0] sum_s, b_s;
    wire [4:0] b_b, a_b;
    wire work_flag;
    
    half_adder adder01(A_in[0], B_in[0], Sum[0], c[0]);
    full_adder adder02(A_in[1], B_in[1], c[0], Sum[1], c[1]);
    full_adder adder03(A_in[2], B_in[2], c[1], Sum[2], c[2]);
    full_adder adder04(A_in[3], B_in[3], c[2], Sum[3], c[3]);
    half_adder adder05(B_in[4], c[3], Sum[4], Sum[5]);
    
    
    
    not not_flag(work_flag, err_flag);
    and en_sum_s01 (sum_s[0], work_flag, Sum[0]);
    and en_sum_s02 (sum_s[1], work_flag, Sum[1]);
    and en_sum_s03 (sum_s[2], work_flag, Sum[2]);
    and en_sum_s04 (sum_s[3], work_flag, Sum[3]);
    and en_sum_s05 (sum_s[4], work_flag, Sum[4]);
    and en_sum_s06 (sum_s[5], work_flag, Sum[5]);
    
    
    and en_b_s01 (b_s[0], err_flag, B_in[0]);
    and en_b_s02 (b_s[1], err_flag, B_in[1]);
    and en_b_s03 (b_s[2], err_flag, B_in[2]);
    and en_b_s04 (b_s[3], err_flag, B_in[3]);
    and en_b_s05 (b_s[4], err_flag, B_in[4]);
    and en_b_s06 (b_s[5], err_flag, 0);
    
    
    and en_b_b01 (b_b[0], work_flag, B_in[0]);
    and en_b_b02 (b_b[1], work_flag, B_in[1]);
    and en_b_b03 (b_b[2], work_flag, B_in[2]);
    and en_b_b04 (b_b[3], work_flag, B_in[3]);
    and en_b_b05 (b_b[4], work_flag, B_in[4]);
    
    
    and en_a_b01 (a_b[0], err_flag, A_in[0]);
    and en_a_b02 (a_b[1], err_flag, A_in[1]);
    and en_a_b03 (a_b[2], err_flag, A_in[2]);
    and en_a_b04 (a_b[3], err_flag, A_in[3]);
    and en_a_b05 (a_b[4], err_flag, 0);
    
    
    or out_s[5:0] (S_out, sum_s, b_s);
    or out_b[4:0] (B_out, b_b, a_b);
endmodule

