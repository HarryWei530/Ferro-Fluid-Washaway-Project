function filecount = count_filenumber(filetype)
    filetype = strcat('*.',filetype);
    list = dir(filetype);
    filecount = length(list);
end