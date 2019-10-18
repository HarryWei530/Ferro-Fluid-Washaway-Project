function loopkmeans(min,max,pausetime,clusternumber)
% loop through pictures specified by min, max, perform Kmeanspic

cluster_center = Kmeanspic('top',min,0,true,1,clusternumber);

parfor i =min+1:max
    Kmeanspic('top',i,cluster_center,false,pausetime,clusternumber);
end