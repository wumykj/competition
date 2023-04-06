function [a] = leibie_count(Chrom,Ha)
   a = zeros(1,4);
   for i = 1:length(Chrom)
       if Chrom(i) == 0
           return;
       end
       a(Ha(Chrom(i))) = a(Ha(Chrom(i)))+1;
   end
end