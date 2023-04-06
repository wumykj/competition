function [pg] =Pagao_time_1(Chrom,Z_2)
    pg=0;
    for i = 1:length(Chrom)
          if Chrom(i) == 0 || Chrom(i+1) == 0
              return
          end
          if Z_2(i+1)>Z_2(i)
              pg = pg +Z_2(i+1)-Z_2(i);
          end
    end
   
end