function [a]=random1(n,i)
   a = randperm(n,i);
   a = sort(a);
end
