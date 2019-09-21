%% Image processing main

first = 28;
last = 30;

cd '/run/media/harry/Elements/Ferro Fluid washaway/Harry n Vincent/2019 new setup/9.20/vol lib 920'
close all;
% last = count_filenumber('JPG');

tic
loopkmeans(first,last,0);
toc
result = loopbincount(first,last)
save('OutputPixCount.txt','result','-ascii')

% 
% cd '/run/media/harry/Elements/Ferro Fluid washaway/Harry n Vincent/2019 new setup/9.20/80 2'
% close all;
% last = count_filenumber('JPG');
% 
% tic
% loopkmeans(first,last,0);
% toc
% result = loopbincount(first,last)
% save('OutputPixCount.txt','result','-ascii')
% 
% 
% cd '/run/media/harry/Elements/Ferro Fluid washaway/Harry n Vincent/2019 new setup/9.20/100 2'
% close all;
% last = count_filenumber('JPG');
% 
% tic
% loopkmeans(first,last,0);
% toc
% result = loopbincount(first,last)
% save('OutputPixCount.txt','result','-ascii')
% 
% cd '/run/media/harry/Elements/Ferro Fluid washaway/Harry n Vincent/2019 new setup/9.20/110 2'
% close all;
% last = count_filenumber('JPG');
% 
% tic
% loopkmeans(first,last,0);
% toc
% result = loopbincount(first,last)
% save('OutputPixCount.txt','result','-ascii')
% 
% 
% cd '/run/media/harry/Elements/Ferro Fluid washaway/Harry n Vincent/2019 new setup/9.20/130 2'
% close all;
% last = count_filenumber('JPG');
% 
% tic
% loopkmeans(first,last,0);
% toc
% result = loopbincount(first,last)
% save('OutputPixCount.txt','result','-ascii')
% 
% cd '/run/media/harry/Elements/Ferro Fluid washaway/Harry n Vincent/2019 new setup/9.20/140 2'
% close all;
% last = count_filenumber('JPG');
% 
% tic
% loopkmeans(first,last,0);
% toc
% result = loopbincount(first,last)
% save('OutputPixCount.txt','result','-ascii')


