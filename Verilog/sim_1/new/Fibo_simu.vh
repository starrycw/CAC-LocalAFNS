`ifndef __FIBO_HEADER__
    `define __FIBO_HEADER__
    
    //FNS value 
    `define FNS_01 1    
    `define FNS_02 1    
    `define FNS_03 2    
    `define FNS_04 3    
    `define FNS_05 5    
    `define FNS_06 8    
    `define FNS_07 13   
    `define FNS_08 21   
    `define FNS_09 34
    `define FNS_10 55   
    
    //FNS Len (eg: FNS03[`FNSLEN_03-1 : 0])
    `define FNSLEN_01 1 
    `define FNSLEN_02 1 
    `define FNSLEN_03 2 
    `define FNSLEN_04 2 
    `define FNSLEN_05 3 
    `define FNSLEN_06 4 
    `define FNSLEN_07 4 
    `define FNSLEN_08 5 
    `define FNSLEN_09 6
    `define FNSLEN_10 6
    
    //binary code len (eg: data[`BLEN_03-1 : 0] can be coded as 3bits FNS-CAC codewords)
    `define BLEN_01 1
    `define BLEN_02 1
    `define BLEN_03 2
    `define BLEN_04 2
    `define BLEN_05 3
    `define BLEN_06 4
    `define BLEN_07 5
    `define BLEN_08 5
    `define BLEN_09 6
    
`endif