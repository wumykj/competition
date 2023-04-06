%% 画路径函数
%输入
% Chrom  待画路径   
% X      各城市坐标位置 第一列为X坐标 第二列为Y坐标
%画图函数需要画出一条或两条线路
function [ output_args ] = DrawPath_1(Chrom ,X )
%DRAWPATH_1 此处显示有关此函数的摘要
figure;
hold on

for i=1:length(Chrom)
    plot(X(Chrom(i),1),X(Chrom(i),2),'o','color',[0.5,0.5,0.5])
%     text(X(i,1)+7,X(i,2)+7,num2str(Chrom(i)),'color',[1,0,0]);
    if i~=length(Chrom)
     line([X(Chrom(i),1),X(Chrom(i+1),1)],[X(Chrom(i),2),X(Chrom(i+1),2)]);
  
    else
        break
    end
end

%plot(X(Chrom(1,1),1),X(Chrom(1,1),2),'rv','MarkerSize',20) 画倒三角
end
