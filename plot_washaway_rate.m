close all;clear;clc;

filename = 'test.xlsx'
[~,sheet_name]=xlsfinfo(filename);

% sheet_name = sort(sheet_name);
figlist = strings(numel(sheet_name));
for k=1:numel(sheet_name)
  data{k}=xlsread(filename,sheet_name{k});
  h{k} = figure('visible','off','position', [0, 0, 5100, 6600]);
  plot_original_and_rate(data{k},sheet_name{k});
  figlist(k) = strcat(sheet_name{k},'.png'); 
  saveas(h{k},sheet_name{k},'png');
end;

function plot_original_and_rate(m,trialname)

x = m(:,1);
y = m(:,2);
n = 3; %Number of repetitive pictures taken

xunique =  unique(x);
yaveraged = zeros(size(xunique));

for i = 1:length(yaveraged)
    
    yaveraged(i) = (y(i*n)+y(i*n-1)+y(i*n-2))/n;
end

dy=diff(yaveraged)./diff(xunique);

subplot(1,2,1)
plot(xunique,yaveraged,'-o');
title(sprintf('Washaway %s', trialname))
axis([0,inf,0,3.5*10^6])
xlabel('Time [s]')
ylabel('Pixel')
grid on

subplot(1,2,2)
plot(xunique(2:end),dy,'-o');
axis([0,inf,-8*10^5,1*10^5])
title(sprintf('Washaway Rate %s', trialname))
xlabel('Time [s]')
ylabel('Rate [\Delta Pixel/s]')
grid on
end




