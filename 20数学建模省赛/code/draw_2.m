clear
clc
load X_2
load Y_2
load D_2
k =[4,5,5,5,4];
cengci = 5;
last = 131;
ma = 131;
ys = ['r*','m*','Y_2*','g*','b+','k+'];
DIS=zeros(150);
shuju = zeros(5,10,5);   %���е�һ����ʾ�ڼ����࣬�ڶ������ڼ��������һ�����ڼ���
 plot(X_2,Y_2,'+');
hold on
plot(X_2(1),Y_2(1),'r*')
hold on
 %��㵽�յ������
 line([X_2(1),X_2(131)],[Y_2(1),Y_2(131)])
 hold on
  %�����ߵķ���
 xm=(X_2(1)+X_2(131))/2;
 ym=(Y_2(1)+Y_2(131))/2;
 k1=(Y_2(131)-Y_2(1))/(X_2(131)-X_2(1));
 k2=-1/k1;
 for hard = 1:5
     q = k(hard);                         %ÿһ��ķ�����
     jiange = 10000/cengci;
     b=ym-k2*xm-4500+(hard-1)*jiange;    %ֱ���ƶ�(X_2ia)
     x0=-b/k2;
     x1=(1500-b)/k2;
     line([x0,x1],[0,1500]); 
     b2=ym-k2*ym-4500+(hard)*jiange;    %shang
     x00=-b2/k2;
     x11=(1500-b2)/k2;
     line([x00,x11],[0,1500]);

     %�ж�
     X_211=zeros(1,150);
     Y_211=zeros(1,150);
     j=1;
     t1=zeros(1,150);
     for ii=1:150
         flag1=X_2(ii)*k2+b;
         flag2=X_2(ii)*k2+b2; %��
         if flag2>=Y_2(ii) 
                if Y_2(ii)>flag1
                X_211(j)=X_2(ii);
                Y_211(j)=Y_2(ii);
                t1(j)=ii;
                j=j+1;
                end    
         end
     end
     for ii=1:150
        if t1(ii)==0
            len1=ii-1;
            break
        end
    end
     plot(X_211(1:len1),Y_211(1:len1),'r*');
     plot(X_2(ma),Y_2(ma),'black*');
     hold on
    X_2X_2=X_211(1:len1);
    Y_2Y_2=Y_211(1:len1);
    location=t1(1:len1);
    [ resX_2,resY_2,record] = FunK_mean( X_2X_2,Y_2Y_2,q);
     resX_2;
    for j = 1:q
        x = resX_2(j,:);
        y = resY_2(j,:);
        for m = 1:length(x)
            bj = panduan(x(m),y(m),X_2,Y_2);
            shuju(j,m,hard)=bj;
        end
        plot(x,y,ys(3));
        hold on
    end 
 end
set(gca,'xLim',[0 1500]);
[n,m,r] = size(shuju);
for i = 1:n
    for j = 1:m
        for t = 1:r
            if shuju(i,j,t)==-1
                shuju(i,j,t)=0;
            end
        end
    end
end
shuju_2 = zeros(5,20,5);
shuju_2(5,17,5) = shuju;


%%
x1 = X_2(1)-X_2(131);
y1 = Y_2(1)-Y_2(131);
k_x = y1/x1;
b_x = Y_2(1)-k_x*X_2(1);
[n,m,r] = size(shuju_2);
for t = 1:r
    for i = 1:n
        %�������û���õ�ֱ������
        if shuju_2(i,1,t) ==0
            continue
        end
        %��ȡ��������д���
        a = shuju_2(i,:,t);
        for j=1:length(a)
            if a(j) == 0
                break;
            end
        end
        %�ҵ�������j��1��Ԫ��
        a = a(1:j-1);
        b = zeros(2,j-1);
        %�ҵ�ÿ�����Ӧ��xֵ
        for o=1:j-1
            b(1,o)=a(o);
            %����ÿ����ĳ���Ӧֵ
            b(2,o)= line_x(x1,y1,k_x,b_x,X_2(a(o)),Y_2(a(o)));
        end
        b = b';
        b = paixun_rows(b,2);
        a = b(:,1)';
        shuju_2(i,1:j-1,t)=a;
    end 
end
shuju_2