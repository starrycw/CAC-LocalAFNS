`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/03 10:18:59
// Design Name: 
// Module Name: Simu_5
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


`include "Fibo_simu.vh"
module Simu_5(

    );
    
    reg [(`BLEN_05 - 1) : 0] datain;
    wire [(`BLEN_05 - 1) : 0] dataout;
    wire [4:0] tsv;
    reg clock;
    
    
    CACcoder_5 coder(
    datain,
    clock,
    tsv,   //[x-1 : 0]
    
    `FNS_02,
    `FNS_03,
    `FNS_04,
    `FNS_05
    );
    
    CACdec_5 decoder(
    tsv,    //[x-1 : 0]
    dataout,
    
    `FNS_03,
    `FNS_04,
    `FNS_05
    );
    
    static int i, m, FTFcheck, err_count;
    
    initial begin
    clock = 0;
    err_count = 0;
    
        for (i=0; i < 100; i++) begin
            datain = i;
            FTFcheck = 0;
            #1;
            clock = 1;
            #1;
            clock = 0;
            for(m=2; m>0; m--) begin
                if( ((tsv[2*m]==1'b0)&&(tsv[2*m-1]==1'b1)) || ((tsv[2*m-1]==1'b1)&&(tsv[2*m-2]==1'b0)) ) begin
                        FTFcheck = 1;
                end 
            end           
            if( (dataout == datain)&&(FTFcheck == 0) ) begin
                $display("test-%d-PASSED,FTF=0101010",i+1);
                $display("test-%d-PASSED,TSV=%b,datain=%b,%d,dataout=%b,%d",i+1,tsv,datain,datain,dataout,dataout);
                end
            else begin
                $display("test-%d-FAILED,FTF=0101010",i+1);
                $display("test-%d-FAILED,TSV=%b,datain=%b,%d,dataout=%b,%d",i+1,tsv,datain,datain,dataout,dataout);
                err_count = err_count+1;
                end 
           #1;
        end
        
        $display("-------------test completed,%derror(s) detected!",err_count);
        $finish();
    
    end
endmodule
