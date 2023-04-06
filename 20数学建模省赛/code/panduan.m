function [ bj ] =  panduan(x,y,X,Y)
   bj = -1;
   for i = 1:length(X)
       if x == X(i) && y == Y(i)
           bj = i;
       end   
   end
end