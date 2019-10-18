function imageprocessing(sourcelocation,trialname,clusternumber,first,last)
% imageprocessing(sourcelocation,trialname,clusternumber,first,last)
% The code changes current directory to source location, process images with given clusternumber, and stores results in subfolder 
% If last<first, all files after first are processed

close all;
cd(sourcelocation);

if last< first
    last = count_filenumber('JPG');
    if last == 0
        last = count_filenumber('jpg');
    end
end

% error handling, if no files matching 'JPG' is found
if last == 0
    disp('Error: last == 0, no file matching "JPG" is found \n');
    return;
end

tic
loopkmeans(first,last,0,clusternumber);
toc
result = loopbincount(first,last)
resultfilename = strcat(trialname,' Cluster = ',int2str(clusternumber),'.txt');
resultfilename = strrep(resultfilename,'/','_');
save(resultfilename,'result','-ascii')

newdir = strcat(pwd,'/n = ',int2str(clusternumber));
movefile('*.bmp',newdir);
copyfile('*.txt',newdir);

end