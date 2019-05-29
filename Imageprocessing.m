%% Image processing main
first = 1;
last = 25;

figure, imshow('top (1).jpg');
h = imrect;
position = wait(h);
rect = getPosition(h);

loopbin(first,last,rect,0);
result = loopcount(first,last);