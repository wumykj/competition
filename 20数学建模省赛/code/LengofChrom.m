%�ж�������������ֵ�ĳ���
function [ j] = Buss(Chrom )
j=1;
for r=1:length(Chrom)
    if Chrom(r)~=0
        j=j+1;
    else
        break
    end
end
j=j-1;
end