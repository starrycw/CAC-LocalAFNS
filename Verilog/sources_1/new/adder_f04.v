`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 15:28:36
// Design Name: 
// Module Name: adder_f04
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


module Adder_f04(
    //1,2,2
    input wire  A_in, //f(k-2)
    input wire [1:0] B_in, //f(k-1)
    output wire [1:0] S_out, //f(k)
    output wire [1:0] B_out, //f(k-1)
    input wire err_flag //1=error

    );
    wire [1:0] Sum;
    wire c;
    wire [1:0] sum_s, b_s;
    wire [1:0] b_b, a_b;
    wire work_flag;
    
    half_adder adder01(A_in, B_in[0], Sum[0], c);
    xor adder02(Sum[1], B_in[1], c);
   
  
    not not_flag(work_flag, err_flag);
    and en_sum_s01 (sum_s[0], work_flag, Sum[0]);
    and en_sum_s02 (sum_s[1], work_flag, Sum[1]);



    and en_b_s01 (b_s[0], err_flag, B_in[0]);
    and en_b_s02 (b_s[1], err_flag, B_in[1]);


    and en_b_b01 (b_b[0], work_flag, B_in[0]);
    and en_b_b02 (b_b[1], work_flag, B_in[1]);


 
    and en_a_b01 (a_b[0], err_flag, A_in);
    and en_a_b02 (a_b[1], err_flag, 1'b0);

 
    or out_s[1:0] (S_out, sum_s, b_s);
    or out_b[1:0] (B_out, b_b, a_b);
    
   
endmodule
