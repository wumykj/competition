clear
clc
load X
load Y
load  data_2

PL=[3 4 5 4 4 3]; %ÿ�������
PM=[2 4 3 0 0    %ÿ��ĸ���
    6 2 6 1 0
    4 1 5 5 7
    6 6 8 4 0 
    6 3 5 3 0
    4 3 1 0 0];
XX=[X ,Y];
Chrom=zeros(1,25);
Chrom(1,1)=1;
% DrawPath_1(Chrom ,XX)


flag=2;
for i=1:length(PL)    %iΪ�ڵڼ���
         Ram=0; 
         Ramk=randperm(PL(i)); %�������ѡ���i�����
         Ram= Ramk(1);
         if i == 3
             Chrom(flag)=98;
             flag = flag+1;
         end
         if i == 6
             Chrom(flag)=25;
             flag = flag+1;
         end
         if PM(i,Ram)<4
             for k=1:4
                 if data_1(Ram,k,i)~=0
                 Chrom(flag)=data_2(Ram,k,i);
                 flag=flag+1;
                 else 
                     break
                 end
             end
         else
             ch=4;
             Ram1=random1(PM(i,Ram),ch);%�������ѡ���i��ĵ�Ram���ǰ3��
             for k=1:ch
                 Chrom(flag)=data_2(Ram,Ram1(k),i);
                 flag=flag+1;
             end
         end
    
end
Chrom(flag)=84;
Chrom
flag
DrawPath_1(Chrom ,XX)
set(gca,'XLim',[0,1500]);
set(gca,'YLim',[0,1500]);
