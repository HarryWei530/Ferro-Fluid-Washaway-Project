function cluster_center = Kmeanspic(filename,number,cluster_center,first_iter,rect,pausetime)
% Performs Kmeans on LAB colour space, save clusters in grayscale
rng(1)
warning('off', 'images:initSize:adjustingMag')
im = imread(sprintf('%s (%d).jpg',filename,number));

figure(1);
imshow(im)
rectangle('Position',rect,'EdgeColor','r')
pause(pausetime)

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
nColors = 5; % Setting number of clusters
if first_iter
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqeuclidean', ...
                                      'Replicates',1);
else
    [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqeuclidean', ...
                                      'Replicates',1,'Start',cluster_center);
end
ROI = reshape(cluster_idx,nrows,ncols);
ROI = uint8(ROI*20);

imwrite(ROI,sprintf('%s(%d).bmp',filename,number));
figure(1);
imshowpair(im,ROI,'checkerboard'),title(sprintf('%s(%d).bmp',filename,number));
pause(pausetime);
warning('on', 'images:initSize:adjustingMag')
