
for i=3:10
    shuju_2(1,i,2) = shuju_2(1,i+1,2);
    if shuju_2(1,i,2)==0
        break;
    end
end
for i=3:10
    shuju_2(3,i,5) = shuju_2(3,i+1,5);
    if shuju_2(3,i,5)==0
        break;
    end
end
load wt2data
for i=12:20
    wt2data(4,i,3) = wt2data(4,i+1,3);
    if wt2data(4,i,3)==0
        break;
    end
end
wt2data
