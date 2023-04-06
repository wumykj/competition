% clear
% clc
% %load ans2_new
load X_2
load Y_2
load Z_2
load Ha_2
ans2_new = zeros(5,30);
ans2_new(:,1:24)=ans2;
T = zeros(5,1);
time_lujin = zeros(5,1);
time_dakai = zeros(5,1);
high_pagao = zeros(5,1);
dakai_leibie_count = zeros(5,4);
for i= 1:5
    Chrom=ans2_new(i,:);
    dakai_leibie_count(i,1:4) = leibie_count(Chrom,Ha_2);
    time_lujin(i) =  Distanse_1(Chrom,X_2,Y_2);
    time_dakai(i) =  Dakai_time_1(Chrom,Ha_2);
    high_pagao(i) =  Pagao_time_1(Chrom,Z_2);
    T(i)=Distanse_1(Chrom,X_2,Y_2)+Dakai_time_1(Chrom,Ha_2);
end
%T_MAX_2 = max(T);
T_MIN = min(T);
people = zeros(5);
for i = 1:length(T)
    people(i) =round( (180-round(T(i))));
end
people_2 = people(:,1);
ans2_jg = [ans2_new,people_2,time_lujin,time_dakai,high_pagao,T,dakai_leibie_count];
