close all;clear;clc;

%% read xlsx files, store sheet names and data
% cd 'D:\Ferro Fluid washaway\Harry n Vincent\2019 new setup\different clusters number test\'
cd '/media/haoranwei/Elements/Ferro Fluid washaway/Harry n Vincent/2019 new setup/With light fixture/10.18'
filename = 'wash away rate 1018 fitted.xlsx';

[~,sheet_name]=xlsfinfo(filename);
sheet_name = sort(sheet_name);

figlist = strings(numel(sheet_name)); % creating list of figures

% %% find index of sheet named 'vol lib', regression on vol lib, and store variables as calibration parameters
% location_of_vollib = find(strcmp(sheet_name,'vol lib'));
% location_of_Vollib = find(strcmp(sheet_name,'Vol lib'));
% if(isempty(location_of_vollib) && isempty(location_of_Vollib))
%    disp('Error: no sheet_name matching "Vol lib" or "vol lib" is found, check xlsx file!'+newline)
%    return
% 
% else if(isempty(location_of_vollib))
%        vollib = xlsread(filename,"Vol lib");
%     else
%         vollib = xlsread(filename,"vol lib");
%     end
%     
% end

for k=1:numel(sheet_name)
  data{k}=xlsread(filename,sheet_name{k});
  h{k} = figure('visible','off','position', [0, 0, 1000, 600]);
  plot_original_and_rate(data{k},sheet_name{k});
end;



function [b1,b2,r2] = plot_original_and_rate(m,trialname)
close all;
x = m(:,1);
y = m(:,2);
n = 3; %Number of repetitive pictures taken

[b1,b2,r2] = regress_exponential(x,y);
yfit = b1*exp(-b2*x);

% plot vol lib
if(strcmp(trialname,"Vol lib") == 1 && strcmp(trialname,"vol lib") == 1)
    plot(x,y,'o');
    title(sprintf('Vol lib' + trialname))
    xlabel('Volume [\miu L]')
    ylabel('Pixel')
    grid on;
    return;
else
    % plot wash away scatter, overlayed with exponential regression curve
    axis([0,inf,-1,10]) % setting axis
    
    hold on
    plot(x,y,'-o');
    title(sprintf('Washaway %s', trialname))
    xlabel('Time [s]')
    ylabel('\muL')
    grid on
    
    plot(x,yfit);
    legend('raw data', 'exponential fit');
    dim = [.3 .5 .3 .3];
    str = {strcat('b1 = ',num2str(b1)),strcat('b2 = ',num2str(b2)),strcat('R^2 = ',num2str(r2))};
    annotation('textbox',dim,'String',str,'FitBoxToText','on');    
    hold off
    curfig = gcf;
    saveas(curfig,strcat(trialname),'png');
end

end

% function [b1,b2] = regress_power(x,y)
%   beta0 = [0;0];
%   modelfun = 'y ~ b2*exp(-b3*x)';
%   % beta0 = [-50 500 -1 500 -1];
%   mdl = fitnlm(x,y,modelfun,beta0);
%   b1 = mdl.Coefficients.Estimate(1);
%   b2 = mdl.Coefficients.Estimate(2);
% end



function [b1,b2,ordinaryr2] = regress_exponential(x,y)
% does ecponential regression on input (x,y), returns b1,b2 and ordinary
% r^2
  beta0 = [0;0];
  modelfun = 'y ~ b1*exp(-b2*x)';
  % beta0 = [-50 500 -1 500 -1];
  mdl = fitnlm(x,y,modelfun,beta0);
  b1 = mdl.Coefficients.Estimate(1);
  b2 = mdl.Coefficients.Estimate(2);
  ordinaryr2 = mdl.Rsquared.Ordinary;
end


