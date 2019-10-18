%% Image processing main

% triallist = {{'70',5},{'100',5},{'140',5},{'140 Trial 2',5},{'150',5},{'150 Trial 2',5}};
triallist = {{'150 Trial 2',5}};

commonrootdir = '/run/media/harry/Elements/Ferro Fluid washaway/Harry n Vincent/2019 new setup/With light fixture/10.11/';

for i = 1:length(triallist)
    
    try
    imageprocessing(strcat(commonrootdir,triallist{i}{1}),triallist{i}{1},triallist{i}{2},1,0);
    catch e
        fprintf(1,'The identifier was:\n%s',e.identifier);
        fprintf(1,'There was an error! The message was:\n%s',e.message);
        continue
    end
end