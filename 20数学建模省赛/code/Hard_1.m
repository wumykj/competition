%% 计算难度函数
%输入
% Chrom  待画路径   
% H      各个点的难度

%输出 T  花费的时间
%画图函数需要画出一条或两条线路
function [ T ] = Hard_1(Chrom,H )
%HARD_1 此处显示有关此函数的摘要
%   此处显示详细说明
sum=0;
for i=1:length(Chrom)
sum=sum+H(Chrom(i));
end
T=sum;
end
