function [Result_6, Result_6a, Result_6b] = GetReparability_2()
% 2020.03.22 运行结果
%Result_6 =
%
%    1.0000    1.0000    1.0000    0.9301    0.7343    0.4079
%
%
%Result_6a =
%
%    1.0000    0.8901    0.6813    0.4236    0.1918    0.0480
%
%
%Result_6b =
%
%    1.0000    1.0000    0.9341    0.7692    0.4995    0.1998
%

%当冗余数为6时（每组3个）
    %可修复的情况个数，依次为失效数为1，2，3，4，5，6时
    Re_6_count = zeros([1,6]);
    Re_6a_count = zeros([1,6]);
    Re_6b_count = zeros([1,6]);
    
    %修复能力
    Result_6 = zeros([1,6]);
    Result_6a = zeros([1,6]);
    Result_6b = zeros([1,6]);
    
    
    %本方案
    Result_6(1) = 1;
    Result_6(2) = 1;
    Result_6(3) = 1;
    
    Result_6(4) = ( (nchoosek(7,1)*nchoosek(7,3)) + (nchoosek(7,2)*nchoosek(7,2)) + (nchoosek(7,3)*nchoosek(7,1)) ) / (nchoosek(14,4));
    Result_6(5) = ( (nchoosek(7,2)*nchoosek(7,3)) + (nchoosek(7,3)*nchoosek(7,2)) ) / (nchoosek(14,5));
    Result_6(6) = ( (nchoosek(7,3)*nchoosek(7,3)) ) / (nchoosek(14,6));
    
    %a-每组单冗余,6组，2*4 + 3*2 = 14， 4组规模为2，2组规模为3
    Result_6a(1) = 1;
    rgroup_a = zeros([1,7]);
    while (rgroup_a(7) == 0)
        for i = 2:1:6
            if( sum(sum(rgroup_a)) == i )
                temp = 1;
                for ii = 1:4
                    temp = temp * nchoosek(2, rgroup_a(ii));
                end
                for ii = 5:6
                    temp = temp * nchoosek(3, rgroup_a(ii));
                end
                Re_6a_count(i) = Re_6a_count(i) + temp;
            end
        end
        
        rgroup_a(1) = rgroup_a(1) + 1;
        for j = 1:6
            if( rgroup_a(j) == 2 )
                rgroup_a(j) = 0;
                rgroup_a(j+1) = rgroup_a(j+1) + 1;
            end
        end
        
        for j = 2:1:6
            Result_6a(j) = Re_6a_count(j) / nchoosek(14, j);
        end
    end
    
    %a-每组2冗余,3组，4*1 + 5*2 = 14， 1组规模为4，2组规模为5
    Result_6b(1) = 1;
    Result_6b(2) = 1;
    rgroup_b = zeros([1,4]);
    while (rgroup_b(4) == 0)
        for i = 3:1:6
            if( sum(sum(rgroup_b)) == i )
                temp = 1;

                temp = temp * nchoosek(4, rgroup_b(1));
                
                for ii = 2:1:3
                    temp = temp * nchoosek(5, rgroup_b(ii));
                end
                Re_6b_count(i) = Re_6b_count(i) + temp;
            end
        end
        
        rgroup_b(1) = rgroup_b(1) + 1;
        for j = 1:3
            if( rgroup_b(j) == 3 )
                rgroup_b(j) = 0;
                rgroup_b(j+1) = rgroup_b(j+1) + 1;
            end
        end
        
        for j = 3:1:6
            Result_6b(j) = Re_6b_count(j) / nchoosek(14, j);
        end
    end
    

%当冗余数为8时（每组4个）


