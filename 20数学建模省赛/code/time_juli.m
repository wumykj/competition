clear
clc
load X
load Y
time_i_j = zeros(100,100);
for i = 1:100
    for j = 1:100
        if i ==j 
            time_i_j(i,j) = 0;
        else
            time_i_j(i,j) = sqrt( (X(i)-X(j))^2+(Y(i)-Y(j))^2 )/1000/6*60;
        end
    end
end