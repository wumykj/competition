% clear
% clc
% %load ans1
load X
load Y
load Ha
T = zeros(5,1);
time_lujin = zeros(5,1);
time_dakai = zeros(5,1);
dakai_leibie_count = zeros(5,4);
for i= 1:5
    Chrom=ans1(i,:);
    dakai_leibie_count(i,1:4) = leibie_count(Chrom,Ha);
    time_lujin(i) =  Distanse_1(Chrom,X,Y);
    time_dakai(i) =  Dakai_time_1(Chrom,Ha);
    T(i)=Distanse_1(Chrom,X,Y)+Dakai_time_1(Chrom,Ha);
end
%T=T(:,1)';
T_MAX = max(T);
T_MIN = min(T);
people = zeros(5,1);
for i = 1:length(T)
    people(i) =round( (180-round(T(i)))+3);
end
people_1 = people(:,1);
ans1_new = [ans1,people_1,time_lujin,time_dakai,T,dakai_leibie_count];
m_lujin = time_lujin
