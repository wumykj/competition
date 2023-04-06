clear
clc
load X_3
load Y_3
load D_3
k =[4,5,5,5,5,5,5,4];
cengci = 8;
last = 176;
ma = 176;
ys = ['r*','m*','Y_3*','g*','b+','k+'];
DIS=zeros(150);
shuju = zeros(5,10,5);   %其中第一个表示第几个类，第二个表达第几个，最后一个表达第几层
 plot(X_3,Y_3,'+');
hold on
plot(X_3(1),Y_3(1),'r*')
hold on
 %起点到终点的连线
 line([X_3(1),X_3(131)],[Y_3(1),Y_3(131)])
 hold on
  %该连线的法线
 xm=(X_3(1)+X_3(131))/2;
 ym=(Y_3(1)+Y_3(131))/2;
 k1=(Y_3(131)-Y_3(1))/(X_3(131)-X_3(1));
 k2=-1/k1;
 for hard = 1:5
     q = k(hard);                         %每一层的分类数
     jiange = 10000/cengci;
     b=ym-k2*xm-4500+(hard-1)*jiange;    %直线移动(X_3ia)
     x0=-b/k2;
     x1=(1500-b)/k2;
     line([x0,x1],[0,1500]); 
     b2=ym-k2*ym-4500+(hard)*jiange;    %shang
     x00=-b2/k2;
     x11=(1500-b2)/k2;
     line([x00,x11],[0,1500]);

     %判断
     X_311=zeros(1,150);
     Y_311=zeros(1,150);
     j=1;
     t1=zeros(1,150);
     for ii=1:150
         flag1=X_3(ii)*k2+b;
         flag2=X_3(ii)*k2+b2; %大
         if flag2>=Y_3(ii) 
                if Y_3(ii)>flag1
                X_311(j)=X_3(ii);
                Y_311(j)=Y_3(ii);
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
     plot(X_311(1:len1),Y_311(1:len1),'r*');
     plot(X_3(ma),Y_3(ma),'black*');
     hold on
    X_3X_3=X_311(1:len1);
    Y_3Y_3=Y_311(1:len1);
    location=t1(1:len1);
    [ resX_3,resY_3,record] = FunK_mean( X_3X_3,Y_3Y_3,q);
     resX_3;
    for j = 1:q
        x = resX_3(j,:);
        y = resY_3(j,:);
        for m = 1:length(x)
            bj = panduan(x(m),y(m),X_3,Y_3);
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
x1 = X_3(1)-X_3(131);
y1 = Y_3(1)-Y_3(131);
k_x = y1/x1;
b_x = Y_3(1)-k_x*X_3(1);
[n,m,r] = size(shuju_2);
for t = 1:r
    for i = 1:n
        %如果这类没被用到直接跳出
        if shuju_2(i,1,t) ==0
            continue
        end
        %读取整个类进行处理
        a = shuju_2(i,:,t);
        for j=1:length(a)
            if a(j) == 0
                break;
            end
        end
        %找到该类有j—1个元素
        a = a(1:j-1);
        b = zeros(2,j-1);
        %找到每个点对应的x值
        for o=1:j-1
            b(1,o)=a(o);
            %按照每个点的车对应值
            b(2,o)= line_x(x1,y1,k_x,b_x,X_3(a(o)),Y_3(a(o)));
        end
        b = b';
        b = paixun_rows(b,2);
        a = b(:,1)';
        shuju_2(i,1:j-1,t)=a;
    end 
end
shuju_2