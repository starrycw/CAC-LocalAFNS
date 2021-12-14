%阵列1的修复能力对比（9*9=81）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%冗余数TSV数为每个编码组3个时共27个：
%%%故障数为1(81)：全部100%
function [Result_27, Result_27_a, Result_27_b, Result_36, Result_36_a, Result_36_b] = GetReparability_1()
%2020.03.22运行结果：
%Result_27 =
%
%    1.0000    1.0000    0.9968    0.9797    0.9347    0.8488    0.7163    0.5451    0.3598    0.1951
%
%
%Result_27_a =
%
%    1.0000    0.9256    0.7657    0.5585    0.3536    0.1905    0.0852    0.0306    0.0085    0.0017
%
%
%Result_27_b =
%
%    1.0000    0.9971    0.9723    0.9091    0.7990    0.6464    0.4699    0.2981    0.1591    0.0680
%
%
%Result_36 =
%
%    1.0000    1.0000    1.0000    0.9992    0.9954    0.9845    0.9608    0.9175    0.8481    0.7484
%
%
%Result_36_a =
%
%    1.0000    0.9502    0.8396    0.6857    0.5138    0.3504    0.2153    0.1179    0.0567    0.0235
%
%
%Result_36_b =
%
%    1.0000    0.9985    0.9857    0.9518    0.8897    0.7963    0.6745    0.5338    0.3887    0.2559
%
%
    %记录故障个数为3，5，……，19个时可以修复的情况数目
    Re_27_count = zeros([1,9]);   %27冗余，本方案
    Re_27a_count = zeros([1,9]);   %27冗余，每组单冗余
    Re_27b_count = zeros([1,9]);   %27冗余，每组2冗余
    Re_36_count = zeros([1,9]);   %36冗余，本方案
    Re_36a_count = zeros([1,9]);   %36冗余，每组单冗余
    Re_36b_count = zeros([1,9]);   %36冗余，每组2冗余
    
    %记录故障个数为1，3，5，……，19个时可以修复能力
    Result_27 = zeros([1,10]);  %27冗余，本方案
    Result_27_a = zeros([1,10]);  %27冗余，每组单冗余
    Result_27_b = zeros([1,10]);  %27冗余，每组双冗余
    Result_36 = zeros([1,10]);  %36冗余，本方案
    Result_36_a = zeros([1,10]);  %36冗余，每组单冗余
    Result_36_b = zeros([1,10]);  %36冗余，每组双冗余
    %故障个数为1时所有方案的修复能力均为1
    Result_27(1) = 1;
    Result_27_a(1) = 1;
    Result_27_b(1) = 1;
    Result_36(1) = 1;
    Result_36_a(1) = 1;
    Result_36_b(1) = 1;

    
    %%%%%%%%%%本方案，27冗余
    tsvline_27 = zeros([1,10]);  %每个修复组，本方案
    temp = 1;  %临时变量，用于累乘组合数，使用前需要先置1
    
    while( (tsvline_27(10) == 0) && (1 == 1) )  %遍历每行可能发生的故障数目（每行故障数最大值为冗余数）
        disp(['27冗余，本方案:', num2str(tsvline_27(9)),num2str(tsvline_27(8)),num2str(tsvline_27(7)),num2str(tsvline_27(6)),num2str(tsvline_27(5)),num2str(tsvline_27(4)),num2str(tsvline_27(3)),num2str(tsvline_27(2)),num2str(tsvline_27(1)) ]);

        for k=1:9
            if( sum(sum(tsvline_27)) == (2*k + 1) )
                temp = 1;
                for j=1:9
                    temp = temp * ( nchoosek(9,tsvline_27(j)) );
                end
                Re_27_count(k) = Re_27_count(k) + temp;
            end
        end

        tsvline_27(1) = tsvline_27(1)+1;
        for i=1:9
            if ( tsvline_27(i) == 4 )
                tsvline_27(i) = 0;
                tsvline_27(i+1) = tsvline_27(i+1) + 1;
            end
        end

    end

    for i=1:9
        Result_27(i+1) = Re_27_count(i) / nchoosek(81, (2*i + 1) );
    end
%    1.0000    1.0000    0.9968    0.9797    0.9347    0.8488    0.7163    0.5451    0.3598    0.1951

    %%%%%%%%%%本方案，36冗余
    tsvline_36 = zeros([1,10]);  %每个修复组，本方案
    temp = 1;  %临时变量，用于累乘组合数，使用前需要先置1
    
    while( (tsvline_36(10) == 0) && (1 == 1) )  %遍历每行可能发生的故障数目（每行故障数最大值为冗余数）
        disp(['36冗余，本方案:', num2str(tsvline_36(9)),num2str(tsvline_36(8)),num2str(tsvline_36(7)),num2str(tsvline_36(6)),num2str(tsvline_36(5)),num2str(tsvline_36(4)),num2str(tsvline_36(3)),num2str(tsvline_36(2)),num2str(tsvline_36(1)) ]);

        for k=1:9
            if( sum(sum(tsvline_36)) == (2*k + 1) )
                temp = 1;
                for j=1:9
                    temp = temp * ( nchoosek(9,tsvline_36(j)) );
                end
                Re_36_count(k) = Re_36_count(k) + temp;
            end
        end

        tsvline_36(1) = tsvline_36(1)+1;
        for i=1:9
            if ( tsvline_36(i) == 5 )
                tsvline_36(i) = 0;
                tsvline_36(i+1) = tsvline_36(i+1) + 1;
            end
        end

    end

    for i=1:9
        Result_36(i+1) = Re_36_count(i) / nchoosek(81, (2*i + 1) );
    end
    
    
    %%%%%%%%%%每组单冗余方案，27冗余
    tsvline_27a = zeros([1,28]);  %每个修复组
    temp = 1;  %临时变量，用于累乘组合数，使用前需要先置1
    
    if( (1 == 1) )  %
        disp(['27冗余，a方案:......']);

        for k=1:9
            Re_27a_count(k) = nchoosek(27,(2*k + 1)) * (3^(2*k + 1));
        end

        

    end

    for i=1:9
        Result_27_a(i+1) = Re_27a_count(i) / nchoosek(81, (2*i + 1) );
    end
    
    %%%%%%%%%%每组单冗余方案，36冗余
    tsvline_36a = zeros([1,37]);  %每个修复组 81 = 2*27 + 3*9（共27+9=36组）
    temp = 1;  %临时变量，用于累乘组合数，使用前需要先置1
    
    if( (1 == 1) )  %
        disp(['36冗余，a方案:......']);

        for k=1:4
            for kk = 0:(2*k + 1)
                Re_36a_count(k) = Re_36a_count(k) + ( nchoosek(9, kk) * (3^kk) * nchoosek(27, ((2*k + 1)-kk)) * (2^((2*k + 1)-kk)) );
            end
        end
        for k=5:9
            for kk = 0:9
                Re_36a_count(k) = Re_36a_count(k) + ( nchoosek(9, kk) * (3^kk) * nchoosek(27, ((2*k + 1)-kk)) * (2^((2*k + 1)-kk)) );
            end
        end

        

    end

    for i=1:9
        Result_36_a(i+1) = Re_36a_count(i) / nchoosek(81, (2*i + 1) );
    end
    
    
    %%%%%%%%%%双冗余方案，27冗余
    tsvline_27b = zeros([1,15]);  %每个修复组,81 = 5*3 + 6*11  (共3+11=14组，实际上是28个冗余，记前3组为5规模的组，后11组为6规模的组)
    temp = 1;  %临时变量，用于累乘组合数，使用前需要先置1
    
    while( (tsvline_27b(15) == 0) && (1 == 1) )  %遍历每行可能发生的故障数目（每行故障数最大值为冗余数）
        disp(['27冗余，b方案:', num2str(tsvline_27b)]);

        for k=1:9
            if( sum(sum(tsvline_27b)) == (2*k + 1) )
                temp = 1;
                for j=1:3
                    temp = temp * ( nchoosek(5,tsvline_27b(j)) );
                end
                for j=4:14
                    temp = temp * ( nchoosek(6,tsvline_27b(j)) );
                end
                
                Re_27b_count(k) = Re_27b_count(k) + temp;
            end
        end

        tsvline_27b(1) = tsvline_27b(1)+1;
        for i=1:14
            if ( tsvline_27b(i) == 3 )
                tsvline_27b(i) = 0;
                tsvline_27b(i+1) = tsvline_27b(i+1) + 1;
            end
        end

    end

    for i=1:9
        Result_27_b(i+1) = Re_27b_count(i) / nchoosek(81, (2*i + 1) );
    end
    

    
    
    %%%%%%%%%%双冗余方案，36冗余——减少运算时间
    tsvline_36b = zeros([1,19]);  %每个修复组,81 = 4*9 + 5*9  (共9+9=18组，36个冗余，记前9组为4规模的组，后9组为5规模的组)
    temp = 1;  %临时变量，用于累乘组合数，使用前需要先置1
    
    count_g4 = zeros([1,18]);  %分别是4规模组中失效TSV数为1，2，……18时所有的可能情况数
    count_g5 = zeros([1,18]);  %分别是5规模组中失效TSV数为1，2，……18时所有的可能情况数
    %err_g4 = zeros([1,10]);  %4规模组中，各组的失效数
    %err_g5 = zeros([1,10]);  %5规模组中，各组的失效数
    err_g = zeros([1,10]);
    
    while (err_g(10) == 0)
        disp(['双冗余方案，36冗余(优化)：', num2str(err_g)]);
        for ii = 1:1:18
            if( sum(sum(err_g)) == ii )
                temp1 = 1;
                temp2 = 1;
                for j = 1:1:9
                   temp1 = temp1 * ( nchoosek(4, err_g(j)) ); 
                   temp2 = temp2 * ( nchoosek(5, err_g(j)) );
                end
                count_g4(ii) =  count_g4(ii) + temp1;
                count_g5(ii) =  count_g5(ii) + temp2;
            end
        end  
        
        err_g(1) = err_g(1) + 1;
            for i = 1:1:9
                if(err_g(i) == 3)
                    err_g(i) = 0;
                    err_g(i+1) = err_g(i+1) + 1;
                end
            end
    end

    
    for k = 1:9
        
        for i = 1:1:(2*k)
            Re_36b_count(k) = Re_36b_count(k) + ( count_g4(i) * count_g5(2*k + 1 - i) );
        end
        if(k < 9)
            Re_36b_count(k) = Re_36b_count(k) + count_g4(2*k + 1) + count_g5(2*k + 1);
        end
        
    end
    
    for i=1:9
        Result_36_b(i+1) = Re_36b_count(i) / nchoosek(81, (2*i + 1) );
    end

