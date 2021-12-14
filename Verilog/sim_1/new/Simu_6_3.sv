`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/26 14:45:32
// Design Name: 
// Module Name: Simu_6_3
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
module Simu_6_3(
    
    );
    
    //TOP
    reg [`BLEN_06-1 : 0] datain;
    wire [`BLEN_06-1 : 0] dataout;
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
    wire [(`FNSLEN_07 - 1) : 0] FNS08_s;
    wire [(`FNSLEN_07 - 1) : 0] FNS09_s;
    
    FNSadders_6_3 adders_sender(
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
    
    coder_6_3 coder_sender(
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
    wire [(`FNSLEN_07 - 1) : 0] FNS08_r;
    wire [(`FNSLEN_07 - 1) : 0] FNS09_r; 
    
    FNSadders_6_3 adders_receiver(
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
    
    dec_6_3 dec_receiver(
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
    static int i, j, k, m, f_num, gene_f, f_num_i, test4_count;
    static int FTFcheck;
    
    initial begin:main
        err_count = 0;
        $display("------------test1 begin------------");
        f_flag = 0;
        clock = 0;
        for (i=0; i<100; i++) begin:for_01
            datain = {$random} %100;
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
         
         $display("------------test4 begin------------");
         test4_count = 0;
         f_flag = 0;
         clock = 0;
         for (i = 500; i>0; i--) begin:cycles
            f_flag = 0;
            clock = 0;
            f_num_i = 0;
            for (f_num = 0; f_num < 3; f_num++) begin:f_num    //f_num < number of redundant tsvs
                f_num_i = f_num_i + 1;
                gene_f = {$random} % 9; //gene_f = {$random} % (x+y)
                while(f_flag[gene_f] == 1) begin
                    gene_f = {$random} % 9; //gene_f = {$random} % (x+y)
                end
                f_flag[gene_f] = 1;
                
              for (j=0; j<50; j++) begin:for_04_j
              datain = {$random} %100;
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
            test4_count = test4_count + 1;          
            if( (dataout == datain)&&(FTFcheck == 0) ) begin
                $display("test04-%d-PASSED,FTF=010101010",test4_count);
                $display("test04-%d-PASSED,TSV=%b,datain=%b,%d,dataout=%b,%d,err_flag=%b,enable_flag=%b",test4_count,tsv,datain,datain,dataout,dataout,f_flag,en_flag_s);
                end
            else begin
                $display("test04-%d-FAILED,FTF=010101010",test4_count);
                $display("test04-%d-FAILED,TSV=%b,datain=%b,%d,dataout=%b,%d,err_flag=%b,enable_flag=%b",test4_count,tsv,datain,datain,dataout,dataout,f_flag,en_flag_s);
                err_count = err_count+1;
                $finish();
                end 
              
            end:for_04_j
                
            end:f_num
         
         end:cycles
         
    
         
         
         
        
        $display("-------------test completed,%derror(s) detected!",err_count);
        $finish();
    end:main
    
    
endmodule
