clear
clc
close all

clear
clc
%����һ��
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

len1=k-1; %�㼯����

XX1=XX(1:len1,1);
YY1=YY(1:len1,1);
X=[ XX1 YY1];  %����  XX YYΪ������
DrawPath_1(X,D1);







% NIND=100;       %��Ⱥ��С
% MAXGEN=200;
% Pc=0.9;         %�������
% Pm=0.05;        %�������
% GGAP=0.9;      %����(Generation gap)
% D=Distanse(X);  %���ɾ������
% N=size(D,1);    %(34*34)
% %% ��ʼ����Ⱥ
% Chrom=InitPop(NIND,N);
% %% �ڶ�άͼ�ϻ������������
% % figure
% % plot(X(:,1),X(:,2),'o');
% %% ����������·��ͼ
% DrawPath(Chrom(1,:),X)
% pause(0.0001)
% %% ���������·�ߺ��ܾ���
% disp('��ʼ��Ⱥ�е�һ�����ֵ:')
% OutputPath(Chrom(1,:));
% Rlength=PathLength(D,Chrom(1,:));
% disp(['�ܾ��룺',num2str(Rlength)]);
% disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
% %% �Ż�
% gen=0;
% figure;
% hold on;box on
% xlim([0,MAXGEN])
% title('�Ż�����')
% xlabel('����')
% ylabel('����ֵ')
% ObjV=PathLength(D,Chrom);  %����·�߳���
% preObjV=min(ObjV);
% while gen<MAXGEN
%     %% ������Ӧ��
%     ObjV=PathLength(D,Chrom);  %����·�߳���
%     % fprintf('%d   %1.10f\n',gen,min(ObjV))
%     line([gen-1,gen],[preObjV,min(ObjV)]);pause(0.0001)
%     preObjV=min(ObjV);
%     FitnV=Fitness(ObjV);
%     %% ѡ��
%     SelCh=Select(Chrom,FitnV,GGAP);
%     %% �������
%     SelCh=Recombin(SelCh,Pc);
%     %% ����
%     SelCh=Mutate(SelCh,Pm);
%     %% ��ת����
%     SelCh=Reverse(SelCh,D);
%     %% �ز����Ӵ�������Ⱥ
%     Chrom=Reins(Chrom,SelCh,ObjV);
%     %% ���µ�������
%     gen=gen+1 ;
% end
% %% �������Ž��·��ͼ
% ObjV=PathLength(D,Chrom);  %����·�߳���
% [minObjV,minInd]=min(ObjV);
% DrawPath(Chrom(minInd(1),:),X)
% %% ������Ž��·�ߺ��ܾ���
% disp('���Ž�:')
% p=OutputPath(Chrom(minInd(1),:));
% disp(['�ܾ��룺',num2str(ObjV(minInd(1)))]);
% disp('-------------------------------------------------------------')
% 
