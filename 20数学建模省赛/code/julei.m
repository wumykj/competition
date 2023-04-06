function [ res ] = julei( XX ,YY,len1,N1 )
%JULEI 此处显示有关此函数的摘要
%   此处显示详细说明
%XX YY需要为列向量
%len1为向量长度


data1=[XX YY];


data=data1; 
N=N1;%设置聚类数目
[m,n]=size(data);
pattern=zeros(m,n+1);
center=zeros(N,n);%初始化聚类中心
pattern(:,1:n)=data(:,:);
for x=1:N
    center(x,:)=data( randi(len1,1),:);%第一次随机产生聚类中心
end
while 1
distence=zeros(1,N);
num=zeros(1,N);
new_center=zeros(N,n);
 
for x=1:m
    for y=1:N
    distence(y)=norm(data(x,:)-center(y,:));%计算到每个类的距离
    end
    [~, temp]=min(distence);%求最小的距离
    pattern(x,n+1)=temp;         
end
k=0;
for y=1:N
    for x=1:m
        if pattern(x,n+1)==y
           new_center(y,:)=new_center(y,:)+pattern(x,1:n);
           num(y)=num(y)+1;
        end
    end
    new_center(y,:)=new_center(y,:)/num(y);
    if norm(new_center(y,:)-center(y,:))<0.1
        k=k+1;
    end
end
if k==N
     break;
else
     center=new_center;
end
end
[m, n]=size(pattern);
 
%最后显示聚类后的数据
res = pattern;
hold on;
for i=1:m
    if pattern(i,n)==1 
         plot(pattern(i,1),pattern(i,2),'r*');
         plot(center(1,1),center(1,2),'ko');
    elseif pattern(i,n)==2
         plot(pattern(i,1),pattern(i,2),'g*');
         plot(center(2,1),center(2,2),'ko');
    elseif pattern(i,n)==3
         plot(pattern(i,1),pattern(i,2),'b*');
         plot(center(3,1),center(3,2),'ko');
    elseif pattern(i,n)==4
         plot(pattern(i,1),pattern(i,2),'y*');
         plot(center(4,1),center(4,2),'ko');
    elseif  pattern(i,n)==5
         plot(pattern(i,1),pattern(i,2),'m*');
         plot(center(5,1),center(5,2),'ko');
     elseif  pattern(i,n)==6
         plot(pattern(i,1),pattern(i,2),'black*');
         plot(center(6,1),center(6,2),'ko');
    elseif  pattern(i,n)==7
         plot(pattern(i,1),pattern(i,2),'r+');
         plot(center(7,1),center(7,2),'ko');
    elseif  pattern(i,n)==8
         plot(pattern(i,1),pattern(i,2),'b+');
         plot(center(8,1),center(8,2),'ko');
    elseif  pattern(i,n)==9
         plot(pattern(i,1),pattern(i,2),'m+');
         plot(center(9,1),center(9,2),'ko');    
    elseif  pattern(i,n)==10
         plot(pattern(i,1),pattern(i,2),'y+');
         plot(center(10,1),center(10,2),'ko');
    end
end
grid on;

end

