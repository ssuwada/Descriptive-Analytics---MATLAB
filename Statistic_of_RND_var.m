%
%   =====REPORT TASK=====
%    Exercise number 1.1
%

%   Initialization;
clear;

%   a) Generate a three samples (N,N2,N3) of size 2000 from a standard normal distribution

N = normrnd(0,1,1,2000);
N2 = normrnd(0,1,1,2000);  
N3 = normrnd(0,1,1,2000);

%   b) Create a sample

Z = N.^2+N.^2+N.^3;

%   c) Create a subplot with two panels.
%       1. Upper plot should compare the empirical cumulative distribution functions (ecdf) 
%       of variables Z and the analytic cdf of χ2(3). Make the analytic curve dotted and black. 
%       Set the limit of the x-axis to run from 0 to 8.

%   Empircial cumulative distribution:

x = linspace(0,8);

ECDF = ecdf(Z);

%   Analytics CDF of χ2 with 3 degree of freedom:

CHI = chi2cdf(x,3);

%   SUBPLOT - FIRST PART( CHI & ECDF )

figure(1)
subplot(2,1,1)
plot(CHI,'linestyle',':','Color',[0,0,0]);
hold;
plot(ECDF,'linestyle','-','Color','red');

legend('CHI','ECDF','location','best');
xticks(1:8)
xlim([1,8])
ylim([0,0.1])

%   SUBPLOT - SECOND PART( ECDF of N,N2,N3 )
%       Lower plot should consist of empirical 
%       cumulative distribution functions of variables 
%       N, N2 and N3. Add a legend in ’best’ position.


%   ECDF of N, N2, N3

ECDFN = ecdf(N);
ECDFN2 = ecdf(N2);
ECDFN3 = ecdf(N3);

%   SUBPLOT
subplot(2,1,2)

%   PLOT N,N2,N3 distributions on subplot 

plot(N,'LineStyle','-','Color','red');
hold;
plot(N2,'LineStyle','-','Color','green');
plot(N3,'LineStyle','-','Color','blue');

legend('N','N2','N3','location','best');


%   d) Basic statistic of variable Z
%       Calculate the basic statistic of variable Z (mean,median,var,skewness) 
%       and compare it in one table with analytic statistics of χ2(3) distribution

%   Mean Z

Mean = mean(Z);

%   Median Z

Median = median(Z);

%   Var Z

Variance = var(Z);

%   Skewness Z

Skewness = skewness(Z,1);

%   Degree of freedom

k = 3;

%   Mean of Chi-squared 

Chi_Mean = k;

%   Median of Chi-squared

Chi_Median = k*((1-(2/9*k)))^3;

%   Variance of Chi-squared 

Chi_Variance = 2*k;

%   Skewness of Chi-squared 

Chi_Skewness = sqrt((8/k));


%
%           Create table
%


%   Define empty table

t = table;

%   Define all table arguments on both rows

firstRow = ["Variable Z";"Chi-dist"];
meanRow = [Mean;Chi_Mean];
medianRow = [Median;Chi_Median];
varianceRow = [Variance;Chi_Variance];
skewnessRow = [Skewness;Chi_Skewness];

%   Define in empty table all arguments

t.Distribution = firstRow;
t.Mean = meanRow;
t.Median = medianRow;
t.Variance = varianceRow;
t.Skewness = skewnessRow;

%   Display table

disp(t);



