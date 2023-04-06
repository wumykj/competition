%% ������·�ĳ���
%����Chrom  �������е�����
%���� X  �����е�λ������ ��һ��ΪX����
%���T  ���ѵ�ʱ��

function T=Distanse_1(Chrom,X,Y)
row=size(X,1);
D=zeros(row,row);
for i=1:row
    for j=i+1:row
        D(i,j)=((X(i)-X(j))^2+(Y(i)-Y(j))^2)^0.5;
        D(j,i)=D(i,j);
    end
end
sum=0;
for i=1:length(Chrom)
    if Chrom(i)==0 ||Chrom(i+1)==0 
        break;
    end
    sum=sum+D(Chrom(i),Chrom(i+1));
end
T=sum/1000/6*60;  %ʱ�䣨���ӣ�
