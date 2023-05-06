
%% REPORT TASK 1.3
%   Import data and clear
clear;
load('data4.mat');


%% 1.3.1
%   Choose a suitable normality test and decide which vector x or y1 is normally distributed.


%   One-sample Kolmogorov-Smirnov test return in vaule that data from
%   vector comes from standard normal distribution or alternative that it
%   doesen't. By using we can decide wihch hipotesis is accurate. 

[h,p_x] = kstest(x);

[h1,p_x1] = kstest(y1);

disp([h,p_x,h1,p_x1]);
disp('--------------------------------------------------------------')
disp(['1.3.1 By using kstest we can say, that x sample is normaly distributed,' ...
      'y1 is not normaly distributed by using KStest.'])
disp('--------------------------------------------------------------')

%   KStes can conclude, that x sample is normaly distributed,
%   y1 is not normaly distributed. 

%% 1.3.2 Plot 
%   Using the subplot, plot the cdf and pdf estimator of not normal vector (x or y1). 
%   Name the distribution.

figure(1)
subplot(2,1,1)
hold;

% Calculate empirical CDF using cdfplot() function

cdfplot(y1);
ylabel('CDF')
title('Empirical CDF')

subplot(2,1,2)

% Calculate empirical PDF using ksdensity function

[x_pdf,f_pdf] = ksdensity(y1);
plot(f_pdf,x_pdf);
ylabel('PDF')
title('Empirical PDF')

disp('--------------------------------------------------------------')
disp(['1.3.2 Plot is showing a distribution which is similar to normal distribution,' ...
    ' but there are some deviations.']);
disp('--------------------------------------------------------------')

hold off;

%% 1.3.3 Test corelation
%   Test the correlation between pairs (x,y1), (x,y2) and (x,y3). 
%   For each pair test both Pearson and Spearman correlation. 
%   For each correlated pair decide whether correlation is positive or negative

%       Ranges from -1 to +1, with 0 indicating no correlation, 
%       -1 is a perfect negative correlation 
%       and +1 indicating a perfect positive correlation.
%       Spearman - non linear corelation
%       Pearson - linear corelation


%%   Is there Corelation between: (x,y1)?

[r1, p1]= corr(x',y1');

[r2, p2] = corr(x',y1','type','Spearman');

disp([r1,r2]);

%   No corelation between x and y1 data

disp('--------------------------------------------------------------')
disp('No corelation between x and y1 data');
disp('--------------------------------------------------------------')


%% Is there Corelation between: (x,y2)?

[r3, p3]= corr(x',y2');

[r4, p4] = corr(x',y2','type','Spearman');

disp([r3,r4]);

%   -0.968 - > near ideal negative corelation between x and y2 data for 
%   Spearman corelation function. 

disp('--------------------------------------------------------------');
disp('Negative Spearman corelation between x and y2 data - r = -0.968');
disp('--------------------------------------------------------------');

%% Is there Corelation between: (x,y3)?

[r5, p5]= corr(x',y3');

[r6, p6] = corr(x',y3','type','Spearman');

disp([r5,r6]);

%   Perfect corelation for Spearman corelation function. -> 1.000
disp('--------------------------------------------------------------');
disp('Positive Spearman corelation between x and y3 data - r = 1.00');
disp('--------------------------------------------------------------');

%% 1.4.1 Additional task

%   Download the data of given two indices1 from S&P500. 
%   Data should last from 31.12.2021 to 31.12.2022.
%       • Upload the data to matlab and select the columns corresponding to the close price
%       • Calculate returns of both indices.

%   Load close price, first index:   -> bacusd

%   Bank of America Corp.

load('bacusd.mat');
load('bacusd_data.mat');

%   Load close price, second index:  -> halusd

%   Halliburton Corp.

load('halusd.mat');
load('halusd_data.mat');
 


%   Calculate return -> declare retur var - with zero init, then in loop for
%   add to each position return of formula.

bacusd_data = table2array(bacusd1);
halusd_data = table2array(halusd1);

retur = zeros(length(bacusd),1);
retur_1 = zeros(length(halusd),1);

for i=1:(length(bacusd)-1)
    retur(i,1) = ((bacusd(i+1,1)-bacusd(i,1))/bacusd(i,1))*100;
    retur_1(i,1) = ((halusd(i+1,1)-halusd(i,1))/halusd(i,1))*100;
end


%% 1.4.2
%   Create a subplot with data visualization. In upper plot you should depict 
%   original data for year 2022 (ommit the one day from 2021). 
%   In lower plot present the percentage return of the index.
%       1. Set the title of the upper plot to the Company name
%       2. Set label of the y-axis to %Price [$]’
%       3. Set label of the x-axis to %Date’
%       4. Set ticks and ticks% labels of the x-axis to indicate the first day of each quartile.

figure(2);
subplot(2,1,1);
hold;

%% BAC

%   Plot BAC-USD

plot(bacusd_data,bacusd);
xlim([bacusd_data(1),bacusd_data(252)]);
title('Bank of America Corp.');
xlabel('Date');
ylabel('Price [$]');
xticks_pos = [bacusd_data(15),bacusd_data(77),bacusd_data(139),bacusd_data(204)];
xticks(xticks_pos)
xticks_labels = {'Q1', 'Q2', 'Q3', 'Q4'};
xticklabels(xticks_labels)


%   Plot BAC-USD percentage of return

subplot(2,1,2);

plot(bacusd_data, retur);
xlim([bacusd_data(1),bacusd_data(252)]);
title('Bank of America Corp.');
xlabel('Date');
ylabel('Percentage of return [%]');
xticks(xticks_pos)
xticklabels(xticks_labels)

disp(xticks_pos)

hold off;

%% HAL USD

figure(3);
subplot(2,1,1);
hold;

%   Plot HAL-USD

plot(halusd_data,halusd);
xlim([halusd_data(1),halusd_data(252)]);
title('Halliburton Corp.');
xlabel('Date');
ylabel('Price [$]');
xticks_pos = [halusd_data(15),halusd_data(77),halusd_data(139),halusd_data(204)];
xticks(xticks_pos)
xticks_labels = {'Q1', 'Q2', 'Q3', 'Q4'};
xticklabels(xticks_labels)


%   Plot HAL-USD percentage of return

subplot(2,1,2);

plot(halusd_data, retur_1);
xlim([halusd_data(1),halusd_data(252)]);
title('Halliburton Corp.');
xlabel('Date');
ylabel('Percentage of return [%]');
xticks(xticks_pos)
xticklabels(xticks_labels)

disp(xticks_pos)

hold off;


%%  1.4.3 Calculate the basic statistic 
%       (Mean, Standard Deviation, Median, MAD, Skewness, Interquartile
%       range3) of returns and display the results in one table. 
%       Remember to name both columns and rows.

%%  BACUSD

%   Mean BAC

Mean = mean(retur);

%   Median BAC

Median = median(retur);

%   Var BAC

Variance = var(retur);

%   Skewness BAC

Skewness = skewness(retur,1);

%   MAD BAC

MaD = mad(retur);

%   Calculate the interquartile range BAC

iqr_val = iqr(retur);

%% HALUSD

%   Mean Z

Mean_1 = mean(retur_1);

%   Median Z

Median_1 = median(retur_1);

%   Var Z

Variance_1 = var(retur_1);

%   Skewness Z

Skewness_1 = skewness(retur_1,1);

%   MAD

MaD_1 = mad(retur_1);

%   Calculate the interquartile range

iqr_val_1 = iqr(retur_1);

%%  TABLE

%
%           Create table
%


%   Define empty table

t = table;

%   Define all table arguments on both rows

firstRow = ["Bank of America Corp.";"Halliburton Corp."];
meanRow = [Mean;Mean_1];
medianRow = [Median;Median_1];
varianceRow = [Variance;Variance_1];
skewnessRow = [Skewness;Skewness_1];
maDRow = [MaD;MaD_1];
iqRRow = [iqr_val;iqr_val_1];


%   Define in empty table all arguments

t.Distribution = firstRow;
t.Mean = meanRow;
t.Median = medianRow;
t.Variance = varianceRow;
t.Skewness = skewnessRow;
t.Mad = maDRow;
t.Interquartile = iqRRow;


%   Display table

disp(t);

%% T test

%   Perform a one-sample t-test with Alpha = 0.01 -> 1% -> BACUSD

[h_bacusd, p_bacusd] = ttest(retur,0,'Alpha',0.01);


%   Perform a one-sample t-test with Alpha = 0.01 -> 1% -> HALUSD

[h_halusd, p_haluusd] = ttest(retur_1,0,'Alpha',0.01);

if h_halusd == 0
    disp('The mean of percentage return for Halliburton Corp. is not significantly(1%) different from 0');
else
    disp('The mean of percentage return for Halliburton Corp. is significantly(1%) different from 0');
end

if h_bacusd == 0
    disp('The mean of percentage return for Bank of America Corp. is not significantly(1%) different from 0');
else
    disp('The mean of percentage return for Bank of America Corp. is significantly(1%) different from 0');
end

disp([h_bacusd,h_halusd]);


%%  Correlation

%   Test the correlation between return of both indices. 
%   If they are correlated decide whether the correlation is positive or negative.
%       1. Prepare a scatter plot
%       2. Based on scatter plot choose between Pearson and Spearman correlation. 
%       3. Give at least one reason why you choose one and not the other



%%  SCATTER PLOT

figure(4);
scatter(retur,retur_1);
title('Bank of America Corp.');
xlabel('Return from Bank of America Corp.');
ylabel('Return of Halliburton Corp.');

%   Choosed Pearson correlation level becouse I think dots are grouping and 
%   I see trend of curving from left to right. Of course probably there is
%   not correlation - but we had to make guess.


%%  BACUSD&HALUSD - CORRELATION 

%[r1_bac_hal, p1_bac_hal]= corr(retur,retur_1);  % - > Pearson

[r2_bac_hal, p2_bac_hal] = corr(retur,retur_1,'type','Spearman');

disp(r2_bac_hal);


%   There is no correlation between those two returns.
disp('--------------------------------------------------------------');
disp('No corelation between BAC and HAL data.');
disp('--------------------------------------------------------------');

%%  Check whether the return of those two indices have the same distribution.

[h1_bacusd, p1_bacusd] = kstest(retur);
[h1_halusd, p1_halusd] = kstest(retur_1);

disp('KS tests, first from left -> bacusd than halusd');
disp([h1_bacusd,h1_halusd]);
disp([p1_bacusd,p1_halusd]);

%% Choose a suitable normality test
%   decide are the index returns are normally distributed. 
%   Is K-Stest suitable in this example? Why

h2_bacusd_jb = jbtest(retur);
h2_bacusd_lil = lillietest(retur);

h2_halusd_jb = jbtest(retur_1);
h2_halusd_lil = lillietest(retur_1);

disp('Lillie test and jbTest:')
disp([h2_halusd_lil,h2_halusd_jb,h2_bacusd_jb,h2_bacusd_lil]);

%   The KS test can be used for any continuous distribution and if we don't
%   know, what kind of data exacly we are operating with, better to perform
%   KS test than Lillie(non-parametric like KS test but better to perform with small size of samples)
%   or jbTest(which is parametric, compare - skewness and kurtosis). 

%   In CONCLUSION - We have small amount of samples, so it would be better
%   to use lillie test that is also suitable normality test, but we have to
%   remember that those test should be performed with other diagnostic methods.
%   I would also conjunction histogram, ksdensity func and qq plot to be sure.


%%  Another plots - last ex.

%   For the index with higher p-value of the normallity test create another subplot:
%       1. Left plot should consist of empirical cumulative distribution functions, 
%       histogram normalize to be the cdf estimator as well as the analytical cdf 
%       function of normal distribution with estimated parameters. 
%       Choose the line style and color so the plot looks tidy. Remember to add the legend and title.
%       2. Right plot should consist of kernel estimated density function, 
%       histogram normalize to be the pdf estimator as well as the analytical pdf 
%       function of normal distribution with estimated parameters. 
%       Choose the line style and color so the plot looks tidy. Remember to add the legend and title.

%   Higher p-value was in BACUSD ->retur

figure(5);
subplot(1,2,1);
hold;

x_retur11 = linspace(-10,10,1000);

%   Empirical cumulative distribution function
cdfplot(retur);
ylabel('y - data');
xlabel('x - data');

%   Create a normalized histogram
histogram(retur, 'Normalization', 'cdf');

%   Analytical CDF function of normal dist. with estimated parameters.
y_retur = normcdf(x_retur11, Mean, sqrt(Variance));
plot(x_retur11,y_retur);

legend('Empirical CDF','Histogram','Analytical CDF','Location','best');
title('CDF');

%%   Right plot

subplot(1,2,2);
hold;

ylabel('y - data');
xlabel('x - data');

%   Create a normalized histogram
histogram(retur, 'Normalization', 'pdf');

%   Plot the empirical PDF 
[fretur, xretur] = ksdensity(retur);
plot(xretur, fretur, Color='Red');

%   Analytical PDF function of normal dist. with estimated parameters.
y_retur1 = normpdf(x_retur11, Mean, sqrt(Variance));
plot(x_retur11,y_retur1);

legend('Histogram','Empirical PDF','Analytical PDF','Location','best');
title('PDF');

hold off;
