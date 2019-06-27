function pix = pixbincount(filename,number);
% return center hull pixel count and save BW picture
%% read in image, determine size
I = imread(sprintf('%s(%d).bmp',filename,number));

[row col] = size(I);
row = uint16(row/2);
col = uint16(col/2);

%% Binarize image by setting inner most ring as one, rest as zeros
center = I(row,col); 
I(I ~= center) = 0;
I(I == center) = 1;
I = logical(I);

%% Gnerate convex hull, select only center hull, save image and generate pixel count of hull
I = bwconvhull(I,'objects');
I = bwlabel(I);
center = I(row,col);
I(I ~= center) = 0;
I(I == center) = 1;

pix = sum(sum(I));

% imshow(I),title(sprintf('BW %s (%d).bmp',filename,number));
imwrite(I,sprintf('BW %s(%d).bmp',filename,number));
