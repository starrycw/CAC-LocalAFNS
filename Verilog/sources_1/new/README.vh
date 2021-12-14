//
//  1.MODULES:
//
//  1.1 adder_fxx: 
//      用于输出第xx位斐波那契数系的加法器。
//      如adder_f05的位恰好可以计算f3+f4=f5
//      Adder_fxx(FNS_n-2_in, FNS_n-1_in, FNS_n_out, FNS_n-1_out, f_flag)
//  
//  1.2 FNSadders_x_y:
//      FNS Adders，包含en_flag的计算电路。其中x为工作TSV数，y为冗余TSV数。    
//
//  1.3 coder_x_y, dec_x_y:
//      编解码器（FTF）。其中x为工作TSV数，y为冗余TSV数。
//
//  1.4 CACcoder_x, CACdec_x:
//      FNS-CAC编解码器（FTF）。其中x为位数。
//
// 
//  2.SIMULATION:
//
//  2.1 Simu_x_y:
//      功能验证。其中x为工作TSV数目，y为冗余TSV数目。
//      验证内容包括：（1）解码器输出的数值是否等于输入编码器的数值；（2）码字是否符合条件，即除了已经锁定的位以外，其它位都满足FTF的条件
//      test01:无故障情况下
//      test02:存在1个失效TSV
//      test03:存在2个失效TSV
//      test04:存在多个失效TSV（最少1个，最多为冗余数目）
//      
//  2.2 Simu_x:
//        FNS-CAC的功能验证。其中x为工作TSV数目。
//        为了检查代码是否有错误。
//        验证：（1）解码器输出的数值是否等于输入编码器的数值；（2）码字是否符合FTF条件