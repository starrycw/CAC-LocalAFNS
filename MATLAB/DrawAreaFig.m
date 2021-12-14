%绘制面积开销的变化趋势折线图
clear all;
close all;

%在冗余TSV数目固定的情况下，面积开销随TSV数目增多而变化的趋势
x1 = 4:1:9;
adders_x1 = [46.44, 74.88, 120.959999, 177.119999, 251.999998, 336.239997];
coder_x1 = [60.48, 106.200001, 156.240001, 245.160002, 375.480004, 544.320003];
decoder_x1 = [16.56, 46.8, 63.720001, 129.24, 222.480001, 293.399999];
CACencoder_x1 = [69.840001, 130.320001, 197.640002, 310.680003, 409.320003, 609.840003];
CACdec_x1 = [29.88, 59.4, 106.2, 167.759999, 226.439999, 275.04];

CACall_x1 = CACdec_x1 + CACencoder_x1;
all_x1 = adders_x1 + coder_x1 + adders_x1 + decoder_x1;

CACcodec_x1 = CACencoder_x1 + CACdec_x1;
codec_x1 = coder_x1 + decoder_x1;

%在总TSV数目固定的情况下，面积开销随冗余TSV比例增多而变化的趋势
x2 = 1:1:7;
adders_x2 = [345.959996, 336.239997, 313.559997, 271.799998, 231.479998, 175.320001, 135.72];
coder_x2 = [599.040004, 544.320003, 567.000003, 558.36, 291.960002, 217.080002, 203.040002];
decoder_x2 = [314.639999, 293.399999, 268.560001, 196.2, 104.04, 104.04, 42.48];

figure(1);
plot(x1,adders_x1,'-k.',x1,coder_x1,'-k.',x1,decoder_x1,'-k.',x1,CACencoder_x1,'-k.',x1,CACdec_x1,'-k.');
axis([3.7,9.3,0,650])
xlabel('Number of TSVs')  %x轴坐标描述
ylabel('Area (um^2)') %y轴坐标描述
set(gca,'XTick',[4:1:9]) 

figure(2);
plot(x1,codec_x1,'-k.',x1,CACcodec_x1,'-k.',x1,adders_x1 * 2,'-k.');
axis([3.7,9.3,0,900])
xlabel('Number of TSVs')  %x轴坐标描述
ylabel('Area (um^2)') %y轴坐标描述
set(gca,'XTick',[4:1:9]) 

figure(3);
plot(x2,adders_x2,'-k.',x2,coder_x2,'-k.',x2,decoder_x2,'-k.');
axis([0.7,7.3,0,600])
xlabel('Number of redundant TSVs')  %x轴坐标描述
ylabel('Area (um^2)') %y轴坐标描述
set(gca,'XTick',[1:1:7]) 
 