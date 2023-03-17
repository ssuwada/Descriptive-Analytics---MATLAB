%
%   =====REPORT TASK=====
%    Exercise number 1.2
%     Sebastian Suwada
%

%%  DESCRIPTION

%   For each sample use two kernel functions with two bandwidth values (for each function) and plot
%       them on one figure (one figure per sample).

%%  FIRST DOT - KERNEL DENSITY FUNCTION

%   First sample of data:

figure(1)

ksdensity(x1,'Kernel','normal','Bandwidth',0.1);

hold;

ksdensity(x1,'Kernel','normal','Bandwidth',1);

ksdensity(x1,'Kernel','triangle','Bandwidth',0.1);

ksdensity(x1,'Kernel','triangle','Bandwidth',1);

legend('Kernel Normal BW - 0.1','Kernel Normal BW - 1','Kernel Triangle BW - 0.1','Kernel Triangle BW - 1','location','best');

hold off;

figure(2)

ksdensity(x2,'Kernel','box','Bandwidth',0.1);

hold;

ksdensity(x2,'Kernel','box','Bandwidth',2);

ksdensity(x2,'Kernel','triangle','Bandwidth',0.1);

ksdensity(x2,'Kernel','triangle','Bandwidth',2);

legend('Kernel Box BW - 0.1','Kernel Box BW - 2','Kernel Triangle BW - 0.1','Kernel Triangle BW - 2','location','best');

hold off;

figure(3)

ksdensity(x3,'Kernel','normal','Bandwidth',0.5);

hold;

ksdensity(x3,'Kernel','normal','Bandwidth',1);

ksdensity(x3,'Kernel','triangle','Bandwidth',0.5);

ksdensity(x3,'Kernel','triangle','Bandwidth',1);

legend('Kernel Normal BW - 0.5','Kernel Normal BW - 3','Kernel Triangle BW - 0.5','Kernel Triangle BW - 3','location','best');

hold off;


%%  WHY WE USE KERNEL DENSITY FUNCTION?

%   Kernel density function is used for creating plots of data to
%   categorize distribution. After creating those plots we can make assume
%   which data can for example have normal distribution. After creating
%   those plots we can go for making qqplots that will give us better
%   view of what is exatcly going on and be more confidend what
%   distribution it is. 

%%  SECOND DOT - QQ PLOTS 

figure(4)
qqplot(x1);

figure(5)
qqplot(x2);

figure(6)
qqplot(x3);

%% QQPLOT
%   Show us line and points that are on plot also, if points oscilate
%   next to created middle line, that can means that this data can be from 
%   assumed distribution. In this case plots from data 'x1' and 'x2' are
%   very close and oscilate next to middle line. Last 'x3' data is way to
%   much out of them and in my opinion is not normal distribution. In
%   conclude I would guess that data from 'x1' and 'x2' are normally distributed.
%%



