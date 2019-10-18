function mvfile(destination)
% Look for .bmp and .txt files and move them into destination folder

    filelist = dir('*.bmp');
    for i = 1:length(filelist)
        filename = filelist(i).name;
        movefile(filename,destination);
    end
    
    filelist = dir('*.txt');
    for i = 1:length(filelist)
        filename = filelist(i).name;
        movefile(filename,destination);
    end
    
end