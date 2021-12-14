%����1���޸������Աȣ�9*9=81��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%������TSV��Ϊÿ��������3��ʱ��27����
%%%������Ϊ1(81)��ȫ��100%
function [Result_27, Result_27_a, Result_27_b, Result_36, Result_36_a, Result_36_b] = GetReparability_1()
%2020.03.22���н����
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
    %��¼���ϸ���Ϊ3��5��������19��ʱ�����޸��������Ŀ
    Re_27_count = zeros([1,9]);   %27���࣬������
    Re_27a_count = zeros([1,9]);   %27���࣬ÿ�鵥����
    Re_27b_count = zeros([1,9]);   %27���࣬ÿ��2����
    Re_36_count = zeros([1,9]);   %36���࣬������
    Re_36a_count = zeros([1,9]);   %36���࣬ÿ�鵥����
    Re_36b_count = zeros([1,9]);   %36���࣬ÿ��2����
    
    %��¼���ϸ���Ϊ1��3��5��������19��ʱ�����޸�����
    Result_27 = zeros([1,10]);  %27���࣬������
    Result_27_a = zeros([1,10]);  %27���࣬ÿ�鵥����
    Result_27_b = zeros([1,10]);  %27���࣬ÿ��˫����
    Result_36 = zeros([1,10]);  %36���࣬������
    Result_36_a = zeros([1,10]);  %36���࣬ÿ�鵥����
    Result_36_b = zeros([1,10]);  %36���࣬ÿ��˫����
    %���ϸ���Ϊ1ʱ���з������޸�������Ϊ1
    Result_27(1) = 1;
    Result_27_a(1) = 1;
    Result_27_b(1) = 1;
    Result_36(1) = 1;
    Result_36_a(1) = 1;
    Result_36_b(1) = 1;

    
    %%%%%%%%%%��������27����
    tsvline_27 = zeros([1,10]);  %ÿ���޸��飬������
    temp = 1;  %��ʱ�����������۳��������ʹ��ǰ��Ҫ����1
    
    while( (tsvline_27(10) == 0) && (1 == 1) )  %����ÿ�п��ܷ����Ĺ�����Ŀ��ÿ�й��������ֵΪ��������
        disp(['27���࣬������:', num2str(tsvline_27(9)),num2str(tsvline_27(8)),num2str(tsvline_27(7)),num2str(tsvline_27(6)),num2str(tsvline_27(5)),num2str(tsvline_27(4)),num2str(tsvline_27(3)),num2str(tsvline_27(2)),num2str(tsvline_27(1)) ]);

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

    %%%%%%%%%%��������36����
    tsvline_36 = zeros([1,10]);  %ÿ���޸��飬������
    temp = 1;  %��ʱ�����������۳��������ʹ��ǰ��Ҫ����1
    
    while( (tsvline_36(10) == 0) && (1 == 1) )  %����ÿ�п��ܷ����Ĺ�����Ŀ��ÿ�й��������ֵΪ��������
        disp(['36���࣬������:', num2str(tsvline_36(9)),num2str(tsvline_36(8)),num2str(tsvline_36(7)),num2str(tsvline_36(6)),num2str(tsvline_36(5)),num2str(tsvline_36(4)),num2str(tsvline_36(3)),num2str(tsvline_36(2)),num2str(tsvline_36(1)) ]);

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
    
    
    %%%%%%%%%%ÿ�鵥���෽����27����
    tsvline_27a = zeros([1,28]);  %ÿ���޸���
    temp = 1;  %��ʱ�����������۳��������ʹ��ǰ��Ҫ����1
    
    if( (1 == 1) )  %
        disp(['27���࣬a����:......']);

        for k=1:9
            Re_27a_count(k) = nchoosek(27,(2*k + 1)) * (3^(2*k + 1));
        end

        

    end

    for i=1:9
        Result_27_a(i+1) = Re_27a_count(i) / nchoosek(81, (2*i + 1) );
    end
    
    %%%%%%%%%%ÿ�鵥���෽����36����
    tsvline_36a = zeros([1,37]);  %ÿ���޸��� 81 = 2*27 + 3*9����27+9=36�飩
    temp = 1;  %��ʱ�����������۳��������ʹ��ǰ��Ҫ����1
    
    if( (1 == 1) )  %
        disp(['36���࣬a����:......']);

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
    
    
    %%%%%%%%%%˫���෽����27����
    tsvline_27b = zeros([1,15]);  %ÿ���޸���,81 = 5*3 + 6*11  (��3+11=14�飬ʵ������28�����࣬��ǰ3��Ϊ5��ģ���飬��11��Ϊ6��ģ����)
    temp = 1;  %��ʱ�����������۳��������ʹ��ǰ��Ҫ����1
    
    while( (tsvline_27b(15) == 0) && (1 == 1) )  %����ÿ�п��ܷ����Ĺ�����Ŀ��ÿ�й��������ֵΪ��������
        disp(['27���࣬b����:', num2str(tsvline_27b)]);

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
    

    
    
    %%%%%%%%%%˫���෽����36���ࡪ����������ʱ��
    tsvline_36b = zeros([1,19]);  %ÿ���޸���,81 = 4*9 + 5*9  (��9+9=18�飬36�����࣬��ǰ9��Ϊ4��ģ���飬��9��Ϊ5��ģ����)
    temp = 1;  %��ʱ�����������۳��������ʹ��ǰ��Ҫ����1
    
    count_g4 = zeros([1,18]);  %�ֱ���4��ģ����ʧЧTSV��Ϊ1��2������18ʱ���еĿ��������
    count_g5 = zeros([1,18]);  %�ֱ���5��ģ����ʧЧTSV��Ϊ1��2������18ʱ���еĿ��������
    %err_g4 = zeros([1,10]);  %4��ģ���У������ʧЧ��
    %err_g5 = zeros([1,10]);  %5��ģ���У������ʧЧ��
    err_g = zeros([1,10]);
    
    while (err_g(10) == 0)
        disp(['˫���෽����36����(�Ż�)��', num2str(err_g)]);
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

