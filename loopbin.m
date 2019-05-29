function loopbin(min,max,rect,pausetime)
%using Kmeansbin, loop through the trials
cluster_center = Kmeansbin('top',min,0,true,rect,pausetime);
for i =min+1:max
    cluster_center = Kmeansbin('top',i,cluster_center,false,rect,pausetime);
end