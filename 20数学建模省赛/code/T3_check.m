clear
clc
load ans3_jg
load X_3
load Y_3
load  data_3
load Ha_3
[n,m,r] =size(data_3);
PM = zeros(8,6);
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
for t = 1:r
    for i = 1:n
        if data_3(i,1,t)==0
            break;
        end
        for j=1:m
            if data_3(i,j,t)==0
                break;
            end
            PM(t,i)=j;
        end
    end
end        
PL=[2,3,2,4,4,5,3,3]; %每层的类数
XX=[X3 ,Y3];
% DrawPath_1(Chrom ,XX)
ans_3 = zeros(4,30);
g = 1;
while g<5
    Chrom=zeros(1,30);
    Chrom(1,1)=1;
    flag=2;
    for i=1:length(PL)    %i为在第几层
             Ram=0; 
             Ramk=randperm(PL(i)); %随机数，选择第i层的类
             Ram= Ramk(1);
             if i == 3
                 Chrom(flag)=3;
                 flag = flag+1;
             end
             if i == 6
                 Chrom(flag)=5;
                 flag = flag+1;
             end
             if PM(i,Ram)<2
                 for k=1:2
                     if data_3(Ram,k,i)~=0
                     Chrom(flag)=data_3(Ram,k,i);
                     flag=flag+1;
                     else 
                         break
                     end
                 end
             else
                 ch=3;
                 Ram1=random1(PM(i,Ram),ch);%随机数，选择第i层的第Ram类的前3个
                 for k=1:ch
                     Chrom(flag)=data_3(Ram,Ram1(k),i);
                     flag=flag+1;
                 end
             end

    end
    Chrom(flag)=176;
    Chrom
    flag
    DIS=Distanse_1(Chrom(1:flag+1),X3,Y3);
    H=Hard_1(Chrom(1:flag),Ha3 );
    SUM=DIS+H;
    %DrawPath_1(Chrom(1:flag) ,XX);
    set(gca,'XLim',[0,2000]);
    set(gca,'YLim',[0,2000]);
    if SUM>120
        ans_3(g,1:flag)=Chrom(1:flag);
        DrawPath_1(Chrom(1:flag) ,XX);
        g = g+1;
    end
end
ans3_jg = ans_3;