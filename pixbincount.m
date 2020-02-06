function pix = pixbincount(filename,number);
% return center hull pixel count and save BW picture
%% read in image, determine size
I = imread(sprintf('%s(%d).bmp',filename,number));

[row col] = size(I);
row = uint16(row/2);
col = uint16(col/2);

%% Binarize image by setting inner most ring as one, rest as zeros
center_rect = I(row-100:row+100,col-100:col+100);
elements = (unique(center_rect))';
if (length(elements)~=1)
    elements = uint16(cat(1,elements,zeros(size(elements))));
    for i = 1:length(elements)
        temp = center_rect;
        temp(temp ~= elements(1,i)) = 0;
        temp(temp == elements(1,i)) = 1;
        elements(2,i) = sum(sum(temp));
    end
    center = max(elements(1,:));
else
    center = elements;
end

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
