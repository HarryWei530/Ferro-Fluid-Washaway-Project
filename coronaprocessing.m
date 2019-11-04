%% Corona processing
% This code saves three inner most clusters (center,corona1,corona2) to a
% .txt file, as well as a .mat file for further regression

% triallist = {{'10.24/7',5},{'10.24/8',5},{'10.24/9',5},{'10.24/10',5},{'10.25/6',5}...
%     ,{'10.25/7',5},{'10.25/8',5},{'10.25/9',5},{'10.25/10',5},{'10.25/8 2',5},...
%     {'10.30/6',5},{'10.30/7',5}};

triallist = {{'7',5}};
% commonrootdir = '/home/harry/FF Wash Workspace/with lab/';
commonrootdir = 'C:\Users\Harry\Desktop\test corona processing\';
subfolder = strcat('\n =',toStringJSON(triallist{1}{2}));

for i = 1:length(triallist)
    try
    corona(strcat(commonrootdir,strcat(triallist{i}{1},subfolder)),triallist{i}{1},1,0);
    catch e
        fprintf(1,'The identifier was:\n%s',e.identifier);
        fprintf(1,'There was an error! The message was:\n%s',e.message);
        continue
    end
end


function corona(sourcelocation,trialname,first,last)
% imageprocessing(sourcelocation,trialname,clusternumber,first,last)
% The code changes current directory to source location, process images with given clusternumber, and stores results in subfolder 
% If last<first, all files after first are processed

close all;
cd(sourcelocation);

if last< first
    last = length(dir('BW top(*).bmp'));
end

% error handling, if no files matching 'JPG' is found
if last == 0
    disp('Error: last == 0, no file matching "top(*).bmp" is found \n');
    return;
end
result = loopcorona(first,last);
resultfilename = strcat(trialname,' Corona = 3');
save(strcat(resultfilename,'.txt'),'result','-ascii')
save(strcat(resultfilename,'.mat'),'result');
end

function pix = loopcorona(first,last)
% loop through pictures specified by min, max,runs coronapixcount
pix = [];
for i = first:last
        pix = [pix;coronapixcount('top',i)];
    end
end


function pix = coronapixcount(filename_prefix,file_number)
I = imread(sprintf('%s(%d).bmp',filename_prefix,file_number)); %Read image of Kmeans result

[row col] = size(I);
row = uint16(row/2);
col = uint16(col/2);

halfmiddlerow = I(row,1:col); % pick the middle row from left half of image
u = unique(halfmiddlerow,'stable'); % a stable unique gives indexes of coronas in order from inner most to outer most

ulen = length(u);
center = sum(I(:) == u(ulen));
corona1 = sum(I(:) == u(ulen-1));
corona2 = sum(I(:) == u(ulen-2)); %Extracting pixel numbers

pix(:,1) = center;
pix(:,2) = corona1;
pix(:,3) = corona2; % Saving results
end
