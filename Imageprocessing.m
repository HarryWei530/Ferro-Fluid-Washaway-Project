%% Image processing main
first = 3;
last = 5;

figure, imshow(sprintf('top (%d).jpg',first));
h = imrect;
position = wait(h);
rect = getPosition(h);

loopkmeans(first,last,rect,0);
result = loopbincount(first,last)
