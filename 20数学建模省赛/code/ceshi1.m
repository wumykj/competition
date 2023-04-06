clear
clc
load time_i_j
load Ha
load ans1_2
% a = ans1_2(1,1:27)
% lujing(a,1,time_i_j,Ha)
problem_ans_1 = zeros(10,33);
a = time_lujin(:,1);
b = time_dakai(:,1);
c = people_1;
problem_ans_1(:,1:30)=ans1_2;
problem_ans_1(:,31)=a;
problem_ans_1(:,32)=b;
problem_ans_1(:,33)=c;
