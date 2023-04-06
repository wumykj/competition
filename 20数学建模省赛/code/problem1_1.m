clear
clc
load X
load Y;
k = [3,4,5,4,4,3];
cengci = 6;
ys = ['r*','m*','y*','g*','b+','k+'];
DIS=zeros(100);
shuju = zeros(5,5,6);   %���е�һ����ʾ�ڼ����࣬�ڶ������ڼ��������һ�����ڼ���
for i=1:100
    for j=1:100
        DIS(i,j)=sqrt((X(i)-X(j))^2+(Y(i)-Y(j))^2);
    end
end
 plot(X,Y,'+');
hold on
plot(X(1),Y(1),'r*')
hold on
%�ҳ����������Զ�ĵ㣨�յ㣩
i = find(DIS(1,:)==max( DIS(1,:)));
plot(X(i),Y(i),'black+');
%�ҳ��������ľ�������  84 33 89
%                �Ѷ�    1  2  3������ѡ��84�ŵ�Ϊ�յ�   
 [y, index] = sort(DIS(1,:));
 
 %��㵽�յ������
 line([X(1),X(i)],[Y(1),Y(i)])
 hold on
 ma=i;
  %�����ߵķ���
 xm=(X(1)+X(i))/2;
 ym=(Y(1)+Y(i))/2;
 k1=(Y(i)-Y(1))/(X(i)-X(1));
 k2=-1/k1;
 for hard = 1:6
     q = k(hard);                         %ÿһ��ķ�����
     jiange = 3000/cengci;
     b=ym-k2*xm+1500-(hard)*jiange;    %ֱ���ƶ�(xia)
     x0=-b/k2;
     x1=(1500-b)/k2;
     line([x0,x1],[0,1500]); 
     b2=ym-k2*xm+1500-(hard-1)*jiange;    %shang
     x00=-b2/k2;
     x11=(1500-b2)/k2;
     line([x00,x11],[0,1500]);

     %�ж�
     X11=zeros(1,100);
     Y11=zeros(1,100);
     j=1;
     t1=zeros(1,100);
     for ii=1:100
         flag1=X(ii)*k2+b;
         flag2=X(ii)*k2+b2; %��
         if flag2>=Y(ii) 
                if Y(ii)>flag1
                X11(j)=X(ii);
                Y11(j)=Y(ii);
                t1(j)=ii;
                j=j+1;
                end    
         end
     end
     for ii=1:100
        if t1(ii)==0
            len1=ii-1;
            break
        end
    end
     plot(X11(1:len1),Y11(1:len1),'r*');
     plot(X(ma),Y(ma),'black*');
     hold on
    XX=X11(1:len1);
    YY=Y11(1:len1);
    location=t1(1:len1);
    [ resX,resY,record] = FunK_mean( XX,YY,q);
    for j = 1:q
        x = resX(j,:);
        y = resY(j,:);
        for m = 1:length(x)
            bj = panduan(x(m),y(m),X,Y);
            shuju(j,m,hard)=bj;
        end
        plot(x,y,ys(6));
        hold on
    end 
 end
set(gca,'XLim',[0 1500]);
