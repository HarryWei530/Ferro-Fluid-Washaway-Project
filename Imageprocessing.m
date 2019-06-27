%% Image processing main
close all;
first = 1;
last = 90;

tic
loopkmeans(first,last,0);
toc
result = loopbincount(first,last)
