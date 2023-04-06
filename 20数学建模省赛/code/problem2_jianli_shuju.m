 clear
 clc
[num]=xlsread('¸½¼þ2_3D.xlsx', 1, 'B2:E151');
X_2 =num(:,1);
Y_2 = num(:,2);
Z_2 = num(:,3);
Ha_2 =num(:,4);
D_2 = zeros(150,150);
for i = 1:150
    for j =i+1:150
        D_2(i,j) = sqrt((X_2(i)-X_2(j))^2+(Y_2(i)-Y_2(j))^2)/1000/6*60;
        D_2(j,i) = D_2(i,j);
    end
end
