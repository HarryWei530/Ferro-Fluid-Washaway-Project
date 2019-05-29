function loopkmeans(min,max,rect,pausetime)
% loop through pictures specified by min, max, perform Kmeanspic
cluster_center = Kmeanspic('top',min,0,true,rect,pausetime);
for i =min+1:max
    cluster_center = Kmeanspic('top',i,cluster_center,false,rect,pausetime);
end
