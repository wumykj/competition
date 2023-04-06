
clear
clc
%划分一层
load X
load Y

res_jihe=zeros(25,3,6);
DIS=zeros(100);
for i=1:100
    for j=1:100
        
        DIS(i,j)=sqrt((X(i)-X(j))^2+(Y(i)-Y(j))^2);

        
    end
end
DIS_1=zscore(DIS);
DIS_2=mapminmax(DIS);



 plot(X,Y,'+');
hold on
plot(X(1),Y(1),'r*')
hold on
%找出距离起点最远的点（终点）
i = find(DIS(1,:)==max( DIS(1,:)));
plot(X(i),Y(i),'black+');
%找出距离起点的距离排序  84 33 89
%                难度    1  2  3，所以选择84号点为终点
 [y, index] = sort(DIS(1,:));
 
 %起点到终点的连线
 line([X(1),X(i)],[Y(1),Y(i)])
 hold on
 ma=i;
  %该连线的法线
 xm=(X(1)+X(i))/2;
 ym=(Y(1)+Y(i))/2;
 k1=(Y(i)-Y(1))/(X(i)-X(1));
 k2=-1/k1;
 for hard = 6:6
     b=ym-k2*xm+1000-(hard-1)*500;    %直线移动(下端)
     x0=-b/k2;
     x1=(1500-b)/k2;
     line([x0,x1],[0,1500]);
     b2=ym-k2*xm+1500-(hard-1)*500; %直线移动（上端）
     x00=-b2/k2;
     x11=(1500-b2)/k2;
     line([x00,x11],[0,1500]);

     %判断
     X11=zeros(1,100);
     Y11=zeros(1,100);
     j=1;
     t1=zeros(1,100);
     for ii=1:100
         flag1=X(ii)*k2+b;
         flag2=X(ii)*k2+b2; %大
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
     set(gca,'XLim',[0 1500]);
     XX=X11(1:len1)';
     YY=Y11(1:len1)';
     res = julei(XX,YY,len1,k(hard));
     [p,o] = size(res);
     for i = 1:p
         res_jihe(i,1,hard)=res(i,1);
         res_jihe(i,2,hard)=res(i,2);
         res_jihe(i,3,hard)=res(i,3);
     end
 end
 