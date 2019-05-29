function vols = loopbincount(min,max)
% loop through pictures specified by min, max, perform pixbincount
vols = [pixbincount('top',min)];
for i =min+1:max
    vols = [ vols ; pixbincount('top',i)];
end
