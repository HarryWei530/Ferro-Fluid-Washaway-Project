function vols = loopcount(min,max)
% R Smyth, Fall 2017, V0.1
% run Haoran Wei's six pairs of "control" photos through
% the volume (and area) approximating function 'aprxVol',
% fit the results to some simple models, and throw it all
% together in one figure
% 
vols = [pixcount('top',min)];
for i =min+1:max
    vols = [ vols ; pixcount('top',i)];
end