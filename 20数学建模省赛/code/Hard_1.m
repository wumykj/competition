%% �����ѶȺ���
%����
% Chrom  ����·��   
% H      ��������Ѷ�

%��� T  ���ѵ�ʱ��
%��ͼ������Ҫ����һ����������·
function [ T ] = Hard_1(Chrom,H )
%HARD_1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
sum=0;
for i=1:length(Chrom)
sum=sum+H(Chrom(i));
end
T=sum;
end
