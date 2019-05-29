function pix = pixcount(filename,number);
%% disp image
I = imread(sprintf('%s(%d).bmp',filename,number));

[row col] = size(I);
row = uint8(row/2);
col = uint8(col/2);

center = I(row,col);
I(I ~= center) = 0;
I(I == center) = 1;
I = logical(I);

row = double(row);
col = double(col);
I = imfill(I,[row col]);
I = bwlabel(I);

center = I(row,col);
I(I ~= center) = 0;
I(I == center) = 1;
imshow(I);
pix = sum(sum(I));

imshow(I),title(sprintf('%s (%d).jpg',filename,number));