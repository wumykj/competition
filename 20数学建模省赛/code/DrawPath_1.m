%% ��·������
%����
% Chrom  ����·��   
% X      ����������λ�� ��һ��ΪX���� �ڶ���ΪY����
%��ͼ������Ҫ����һ����������·
function [ output_args ] = DrawPath_1(Chrom ,X )
%DRAWPATH_1 �˴���ʾ�йش˺�����ժҪ
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

%plot(X(Chrom(1,1),1),X(Chrom(1,1),2),'rv','MarkerSize',20) ��������
end
