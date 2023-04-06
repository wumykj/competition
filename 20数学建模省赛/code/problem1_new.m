clear
clc
load X
load Y
load  data_2
load Ha
load Data1
XA=D1;
NIND=200;       %种群大小
MAXGEN=200;
Pc=0.9;         %交叉概率
Pm=0.05;        %变异概率
GGAP=0.9;      %代沟(Generation gap)  
D=Distanse(XA);  %生成距离矩阵
N=size(D,1);   

Chrom=InitPop(NIND,N);  %种群数量
gen=0;
figure;
hold on;box on
xlim([0,MAXGEN])
title('优化过程')
xlabel('代数')
ylabel('最优值')
ObjV=PathLength(D,Chrom);  %计算路线长度
preObjV=min(ObjV);
while gen<MAXGEN
    ObjV=PathLength(D,Chrom);  %计算路线长度   
    line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
    preObjV=min(ObjV);
    FitnV=Fitness(ObjV); 
    SelCh=Select(Chrom,FitnV,GGAP);   
    SelCh=Recombin(SelCh,Pc); 
    SelCh=Mutate(SelCh,Pm);
    SelCh=Reverse(SelCh,D);
    Chrom=Reins(Chrom,SelCh,ObjV);
    gen=gen+1 ;
end
PL=[3 4 5 4 4 3]; %每层的类数
PM=[2 4 3 0 0    %每类的个数
    6 2 6 1 0
    4 1 5 5 7
    6 6 8 4 0 
    6 3 5 3 0
    4 3 1 0 0];
Chrom=zeros(1,30);
Chrom(1,1)=1;
XX = [X,Y];
% DrawPath_1(Chrom ,XX)
ans1 = zeros(5,30);
g = 1;
while g<6
    flag=2;
    for i=1:length(PL)    
        Ram=0; 
             Ramk=randperm(PL(i));
             Ram= Ramk(1);
             if i == 3
                 Chrom(flag)=98;
                 flag = flag+1;
             end
             if i == 6
                 Chrom(flag)=25;
                 flag = flag+1;
             end
             if PM(i,Ram)<5
                 for k=1:4
                     if data_2(Ram,k,i)~=0
                     Chrom(flag)=data_2(Ram,k,i);
                     flag=flag+1;
                     else 
                         break
                     end
                 end
             else
                 ch=4;
                 Ram1=random1(PM(i,Ram),ch);
                 for k=1:ch
                     Chrom(flag)=data_2(Ram,Ram1(k),i);
                     flag=flag+1;
                 end
             end

    end
    Chrom(flag)=84;

    Chrom
    flag;
    DIS=Distanse_1(Chrom,X,Y);
     H=Hard_1(Chrom(1:flag),Ha );
     SUM=DIS+H;
    DrawPath_1(Chrom(1:flag) ,XX);
    set(gca,'XLim',[0,1500]);
    set(gca,'YLim',[0,1500]);

    if SUM>90
        ans1(g,1:flag)=Chrom(1:flag);
        g = g+1;
    end
end
g
