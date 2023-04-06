function [t] = Dakai_time_1(Chrom,Ha)
  t=0;
  for i = 1:length(Chrom)
      if Chrom(i) == 0
          return
      end
      t = t+Ha(Chrom(i));
  end
end