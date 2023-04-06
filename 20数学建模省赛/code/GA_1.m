clear
clc
close all

clear
clc
%划分一层
load X1
load Y1
load Data1
load res_jieguo
res_jihe
XX=zeros(50,1);
YY=zeros(50,1);
k=1; k2=1;
flag=[1,2,2,2,2,1];
for m=1:2  
        for jj=1:9
          if  res_jihe(flag(k2),jj,m)~=0 && res_jihe(flag(k2),jj,m)~=-1        
              XX(k)=X1(res_jihe(flag(k2),jj,m));
               YY(k)=Y1(res_jihe(flag(k2),jj,m));
               k=k+1;
          else
              k2=k2+1;
              break
          end
        end   
end
% XX(k)=X1(1); YY(k)=Y1(1);
% XX(k+1)=X1(84); YY(k+1)=Y1(84);

len1=k-1; %点集个数

XX1=XX(1:len1,1);
YY1=YY(1:len1,1);
X=[ XX1 YY1];  %坐标  XX YY为列向量
DrawPath_1(X,D1);







% NIND=100;       %种群大小
% MAXGEN=200;
% Pc=0.9;         %交叉概率
% Pm=0.05;        %变异概率
% GGAP=0.9;      %代沟(Generation gap)
% D=Distanse(X);  %生成距离矩阵
% N=size(D,1);    %(34*34)
% %% 初始化种群
% Chrom=InitPop(NIND,N);
% %% 在二维图上画出所有坐标点
% % figure
% % plot(X(:,1),X(:,2),'o');
% %% 画出随机解的路线图
% DrawPath(Chrom(1,:),X)
% pause(0.0001)
% %% 输出随机解的路线和总距离
% disp('初始种群中的一个随机值:')
% OutputPath(Chrom(1,:));
% Rlength=PathLength(D,Chrom(1,:));
% disp(['总距离：',num2str(Rlength)]);
% disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
% %% 优化
% gen=0;
% figure;
% hold on;box on
% xlim([0,MAXGEN])
% title('优化过程')
% xlabel('代数')
% ylabel('最优值')
% ObjV=PathLength(D,Chrom);  %计算路线长度
% preObjV=min(ObjV);
% while gen<MAXGEN
%     %% 计算适应度
%     ObjV=PathLength(D,Chrom);  %计算路线长度
%     % fprintf('%d   %1.10f\n',gen,min(ObjV))
%     line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
%     preObjV=min(ObjV);
%     FitnV=Fitness(ObjV);
%     %% 选择
%     SelCh=Select(Chrom,FitnV,GGAP);
%     %% 交叉操作
%     SelCh=Recombin(SelCh,Pc);
%     %% 变异
%     SelCh=Mutate(SelCh,Pm);
%     %% 逆转操作
%     SelCh=Reverse(SelCh,D);
%     %% 重插入子代的新种群
%     Chrom=Reins(Chrom,SelCh,ObjV);
%     %% 更新迭代次数
%     gen=gen+1 ;
% end
% %% 画出最优解的路线图
% ObjV=PathLength(D,Chrom);  %计算路线长度
% [minObjV,minInd]=min(ObjV);
% DrawPath(Chrom(minInd(1),:),X)
% %% 输出最优解的路线和总距离
% disp('最优解:')
% p=OutputPath(Chrom(minInd(1),:));
% disp(['总距离：',num2str(ObjV(minInd(1)))]);
% disp('-------------------------------------------------------------')
% 
