function cluster_center = Kmeanspic(filename,number,cluster_center,first_iter,pausetime,nColors)

warning('off','images:initSize:adjustingMag');
fprintf("Kmeans is running on top (%d)\n",number);
rng(1)
im = imread(sprintf('%s (%d).JPG',filename,number));

%% determines ROI
    imROI = rgb2gray(im);
    level = graythresh(imROI);
    BW = imbinarize(imROI,level);  %Otsu thresholding
    BW = logical(BW*-1+1);

    BW= bwlabel(BW, 8);
    stats = regionprops(BW,'Area','Centroid');
    idx = find([stats.Area] == max([stats.Area]));  %Find maximum connected component (should be the droplet)
    center = uint16(stats(idx).Centroid);  %Find center of droplet
    rect = [center(1)-2000,center(2)-1500,4000,3000];  %Form ROI around center of droplet 
%% Performs Kmeans on LAB colour space, save clusters in grayscale

if(pausetime~=0)
    figure(1);
    imshow(im)
    rectangle('Position',rect,'EdgeColor','r')
    pause(pausetime);
    close(figure(1));
end

%% cropping image according to rectangle
im = imcrop( im, rect );
ROI = im;
sidelength = rect(3);
sideheight = rect(4);

%% Kmeans binarize
cform = makecform('srgb2lab');
lab_he = applycform(ROI,cform);
ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
% nColors = 8; % Setting number of clusters
if first_iter
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqeuclidean', ...
                                      'Replicates',1,'Options',statset('UseParallel',true));
else
    [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqeuclidean', ...
                                      'Replicates',1,'Start',cluster_center,'Options',statset('UseParallel',true));
end
ROI = reshape(cluster_idx,nrows,ncols);
ROI = uint8(ROI*20);

imwrite(ROI,sprintf('%s(%d).bmp',filename,number));
figure(1);
%imshowpair(im,ROI,'checkerboard'),title(sprintf('%s(%d).bmp',filename,number));
%pause(pausetime);
