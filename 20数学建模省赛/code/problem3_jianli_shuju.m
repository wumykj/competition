 clear
 clc
[num]=xlsread('¸½¼þ3.xlsx', 1, 'B2:E201');
[num1]=xlsread('¸½¼þ3.xlsx', 2, 'B2:B121');
X_3 =num(:,1);
Y_3 = num(:,2);
Z_3 = num(:,3);
Ha_3 =num(:,4);
people_v = num1;
D_3 = zeros(200,200);
for i = 1:200
    for j =i+1:200
        D_3(i,j) = sqrt((X_3(i)-X_3(j))^2+(Y_3(i)-Y_3(j))^2)/1000/6*60;
        D_3(j,i) = D_3(i,j);
    end
end
% k = max(D_3(1,:));
% % [a b]=find(D_3==k);
%%ÖÕµã176