%读取excel中，第1个sheet，A2-C5之间的内容
%k是分类数
k=6;
ys = ['r*','m*','y*','g*','b+','k+'];
[num]=xlsread('附件1_2D.xlsx', 1, 'A2:D101');
point_x = num(:,2)';
point_y = num(:,3)';
%plot(point_x,point_y,'r*');
[ resX,resY,record] = FunK_mean( point_x,point_y,k );
for j = 1:k
    x = resX(j,:);
    y = resY(j,:);
    plot(x,y,ys(6));
end        
% x = resX(1,:);
% y = resY(1,:);
% plot(x,y,'r*');
% hold on
% 
% x = resX(2,:);
% y = resY(2,:);
% plot(x,y,'m*');
% hold on
% 
% x = resX(3,:);
% y = resY(3,:);
% plot(x,y,'y*');
% hold on
% 
% x = resX(4,:);
% y = resY(4,:);
% plot(x,y,'g*');
% hold on
% 
% x = resX(5,:);
% y = resY(5,:);
% plot(x,y,'b+');
% hold on
% 
% x = resX(6,:);
% y = resY(6,:);
% plot(x,y,'k+');
% hold on
% 
% hold off
