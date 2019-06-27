function loopkmeans(min,max,pausetime)
% loop through pictures specified by min, max, perform Kmeanspic

cluster_center = Kmeanspic('top',min,0,true,1);

parfor i =min+1:max
    Kmeanspic('top',i,cluster_center,false,pausetime);
end