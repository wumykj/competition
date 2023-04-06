clear
clc
load X_2
load Y_2
load  wt2data
load Ha_2
[n,m,r] =size(wt2data);
PM = zeros(5,5);
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
        if wt2data(i,1,t)==0
            break;
        end
        for j=1:m
            if wt2data(i,j,t)==0
                break;
            end
            PM(t,i)=j;
        end
    end
end        
PL=[4 5 5 5 4]; %每层的类数
XX=[X_2 ,Y_2];

ans2 = zeros(15,30);
g = 1;
while g<6
    Chrom=zeros(1,30);
    Chrom(1,1)=1;
    flag=2;
    for i=1:length(PL)    %i为在第几层
             Ram=0; 
             Ramk=randperm(PL(i)); 
             Ram= Ramk(1);
             if i == 2
                 Chrom(flag)=29;
                 flag = flag+1;
             end
             if i == 4
                 Chrom(flag)=115;
                 flag = flag+1;
             end
             if PM(i,Ram)<4
                 for k=1:4
                     if wt2data(Ram,k,i)~=0
                     Chrom(flag)=wt2data(Ram,k,i);
                     flag=flag+1;
                     else 
                         break
                     end
                 end
             else
                 ch=4;
                 Ram1=random1(PM(i,Ram),ch);
                 for k=1:ch
                     Chrom(flag)=wt2data(Ram,Ram1(k),i);
                     flag=flag+1;
                 end
             end

    end
    Chrom(flag)=131;
    Chrom
    flag
    DIS=Distanse_1(Chrom(1:flag+1),X_2,Y_2);
    H=Hard_1(Chrom(1:flag),Ha_2 );
    SUM=DIS+H;
    %DrawPath_1(Chrom(1:flag) ,XX);
    set(gca,'XLim',[0,1500]);
    set(gca,'YLim',[0,1500]);
    if SUM>120
        ans2(g,1:flag)=Chrom(1:flag);
        DrawPath_1(Chrom(1:flag) ,XX);
        g = g+1;
    end
end
ans2_jg = ans2;
