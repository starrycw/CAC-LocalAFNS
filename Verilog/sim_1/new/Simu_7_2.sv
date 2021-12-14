`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/26 14:45:32
// Design Name: 
// Module Name: Simu_7_2
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
module Simu_7_2(
    
    );
    
    //TOP
    reg [`BLEN_07-1 : 0] datain;
    wire [`BLEN_07-1 : 0] dataout;
    wire [8:0] tsv; //[(x+y-1) : 0]
    reg clock;
    reg [8:0] f_flag;   //[(x+y-1) : 0]
    
    //TOP:Sender
    wire [8:0] en_flag_s;   //[(x+y-1) : 0]
    
    wire [(`FNSLEN_02 - 1) : 0] FNS02_s;   
    wire [(`FNSLEN_03 - 1) : 0] FNS03_s;
    wire [(`FNSLEN_04 - 1) : 0] FNS04_s;
    wire [(`FNSLEN_05 - 1) : 0] FNS05_s;
    wire [(`FNSLEN_06 - 1) : 0] FNS06_s;
    wire [(`FNSLEN_07 - 1) : 0] FNS07_s;
    
    wire [(`FNSLEN_08 - 1) : 0] FNS08_s;
    wire [(`FNSLEN_08 - 1) : 0] FNS09_s;
    
    FNSadders_7_2 adders_sender(
    f_flag,    //[(x+y-1):0], f_flag[0] is the faulty flag of the first TSV
    en_flag_s,  //[(x+y-1):0]
    FNS02_s,
    FNS03_s,
    FNS04_s,
    FNS05_s,
    FNS06_s,
    FNS07_s,
    
    FNS08_s,
    FNS09_s
    );
    
    coder_7_2 coder_sender(
    datain,
    clock,
    tsv,   // [(x+y-1) : 0]
    en_flag_s,   // [(x+y-1) : 0]
    
    FNS02_s,
    FNS03_s,
    FNS04_s,
    FNS05_s,
    FNS06_s,
    FNS07_s,
    
    FNS08_s,
    FNS09_s
    );
    
    //TOP:Receiver
    wire [8:0] en_flag_r;   //[(x+y-1) : 0]
    
    wire [(`FNSLEN_02 - 1) : 0] FNS02_r;   
    wire [(`FNSLEN_03 - 1) : 0] FNS03_r;
    wire [(`FNSLEN_04 - 1) : 0] FNS04_r;
    wire [(`FNSLEN_05 - 1) : 0] FNS05_r;
    wire [(`FNSLEN_06 - 1) : 0] FNS06_r;
    wire [(`FNSLEN_07 - 1) : 0] FNS07_r;
    
    wire [(`FNSLEN_08 - 1) : 0] FNS08_r;
    wire [(`FNSLEN_08 - 1) : 0] FNS09_r; 
    
    FNSadders_7_2 adders_receiver(
    f_flag,    //[(x+y-1):0], f_flag[0] is the faulty flag of the first TSV
    en_flag_r,  //[(x+y-1):0]
    FNS02_r,
    FNS03_r,
    FNS04_r,
    FNS05_r,
    FNS06_r,
    FNS07_r,
    
    FNS08_r,
    FNS09_r
    );
    
    dec_7_2 dec_receiver(
    tsv,    //[(x+y-1):0]
    dataout,
    en_flag_r,   //[(x+y-1):0]
    
    FNS03_r,
    FNS04_r,
    FNS05_r,
    FNS06_r,
    FNS07_r,
    
    FNS08_r,
    FNS09_r

    );
    
    
    //SIMULATION
    static int err_count;
    static int i, j, k, m;
    static int FTFcheck;
    
    initial begin:main
        err_count = 0;
        $display("------------test1 begin------------");
        f_flag = 0;
        clock = 0;
        for (i=0; i<50; i++) begin:for_01
            datain = {$random} %34;
            #1;
            clock = 1;
            FTFcheck = 0;
            #1;
            clock = 0;
            for(m=4; m>0; m--) begin
                if( ((tsv[2*m]==1'b0)&&(tsv[2*m-1]==1'b1)&&(en_flag_s[2*m]==1'b1)&&(en_flag_s[2*m-1]==1'b1)) || ((tsv[2*m-1]==1'b1)&&(tsv[2*m-2]==1'b0)&&(en_flag_s[2*m-1]==1'b1)&&(en_flag_s[2*m-2]==1'b1)) ) begin
                        FTFcheck = 1;
                end 
            end           
            if( (dataout == datain)&&(FTFcheck == 0) ) begin
                $display("test01-%d-PASSED,FTF=010101010",i+1);
                $display("test01-%d-PASSED,TSV=%b,datain=%b,%d,dataout=%b,%d,err_flag=%b,enable_flag=%b",i+1,tsv,datain,datain,dataout,dataout,f_flag,en_flag_s);
                end
            else begin
                $display("test01-%d-FAILED,FTF=010101010",i+1);
                $display("test01-%d-FAILED,TSV=%b,datain=%b,%d,dataout=%b,%d,err_flag=%b,enable_flag=%b",i+1,tsv,datain,datain,dataout,dataout,f_flag,en_flag_s);
                err_count = err_count+1;
                end 
                
         end:for_01
         
         $display("------------test2 begin------------");
         f_flag = 0;
         clock = 0;
         for (j=0; j<9; j++) begin:for_02_j
            f_flag[j]=1;
            for (i=0; i<50; i++) begin:for_02_i
              datain = {$random} %34;
               #1;
               clock = 1;
               FTFcheck = 0;
               #1;
               clock = 0;
               for(m=4; m>0; m--) begin
                if( ((tsv[2*m]==1'b0)&&(tsv[2*m-1]==1'b1)&&(en_flag_s[2*m]==1'b1)&&(en_flag_s[2*m-1]==1'b1)) || ((tsv[2*m-1]==1'b1)&&(tsv[2*m-2]==1'b0)&&(en_flag_s[2*m-1]==1'b1)&&(en_flag_s[2*m-2]==1'b1)) ) begin
                        FTFcheck = 1;
                end 
               end           
            if( (dataout == datain)&&(FTFcheck == 0) ) begin
                $display("test02-%d-%d-PASSED,FTF=010101010",j,i+1);
                $display("test02-%d-%d-PASSED,TSV=%b,datain=%b,%d,dataout=%b,%d,err_flag=%b,enable_flag=%b",j,i+1,tsv,datain,datain,dataout,dataout,f_flag,en_flag_s);
                end
            else begin
                $display("test02-%d-%d-FAILED,FTF=010101010",j,i+1);
                $display("test02-%d-%d-FAILED,TSV=%b,datain=%b,%d,dataout=%b,%d,err_flag=%b,enable_flag=%b",j,i+1,tsv,datain,datain,dataout,dataout,f_flag,en_flag_s);
                err_count = err_count+1;
                end   
            end:for_02_i
            f_flag=0;
         end:for_02_j
         
         
         $display("------------test3 begin------------");
         f_flag = 0;
         clock = 0;
         for (j=1; j<9; j++) begin:for_03_j
            f_flag[j]=1;
            for(k=0; k<j; k++) begin:for_03_k
            f_flag[k]=1;
            for (i=0; i<50; i++) begin:for_03_i
              datain = {$random} %34;
               #1;
               clock = 1;
               FTFcheck=0;
               #1;
                clock = 0;
                for(m=4; m>0; m--) begin
                    if( ((tsv[2*m]==1'b0)&&(tsv[2*m-1]==1'b1)&&(en_flag_s[2*m]==1'b1)&&(en_flag_s[2*m-1]==1'b1)) || ((tsv[2*m-1]==1'b1)&&(tsv[2*m-2]==1'b0)&&(en_flag_s[2*m-1]==1'b1)&&(en_flag_s[2*m-2]==1'b1)) ) begin
                        FTFcheck = 1;
                    end 
                end          
            if( (dataout == datain)&&(FTFcheck == 0) ) begin
                $display("test03-%d-%d-%d-PASSED,FTF=010101010",j,k,i+1);
                $display("test03-%d-%d-%d-PASSED,TSV=%b,datain=%b,%d,dataout=%b,%d,err_flag=%b,enable_flag=%b",j,k,i+1,tsv,datain,datain,dataout,dataout,f_flag,en_flag_s);
                end
            else begin
                $display("test03-%d-%d-%d-FAILED,FTF=010101010",j,k,i+1);
                $display("test03-%d-%d-%d-FAILED,TSV=%b,datain=%b,%d,dataout=%b,%d,err_flag=%b,enable_flag=%b",j,k,i+1,tsv,datain,datain,dataout,dataout,f_flag,en_flag_s);
                err_count = err_count+1;
                end   
            end:for_03_i
            f_flag[k]=0;
            end:for_03_k
            f_flag=0;
         end:for_03_j
        
        $display("-------------test completed,%derror(s) detected!",err_count);
        $finish();
    end:main
    
    
endmodule
