%   Analyze model with t-test. Decide whether some variables are irrelevant.

%   V alue = β0 + β1Area + β2Age + β3Distance + β4Facilities + β5Assessment + ε
clear;
clc;

t = readtable("report_task_2_3.csv");


y = t.Value;
x(:,1) = t.Flat_area;
x(:,2) = t.building_age;
x(:,3) = t.Distance_from_center;
x(:,4) = t.Additional_facilities_area;
x(:,5) = t.subjective_assessment;
x(:,6) = 1;

[beta, L, se] = OLS(x,y);

N = length(y);
k = size(x,2);
p = myttest(beta,se,N,k);

for i = 1:length(p)
    if p(i)>0.05
       disp(['P value for b' num2str(i)  ' is equal to ' num2str(p(i)) ' and this value is irrelevant'])
    else
       disp(['P value for b' num2str(i)  ' is equal to ' num2str(p(i)) ' and this value is relevant'])
    end
end

%   • Put the restriction that βi = 0 for irrelevant variables and that the average price for square meter
%   of the flat is worth 10000 (β1 = 10000)
%   • Use the Wald test to check the restriction and interpret the test result.

%% WALD TEST

%   Define constrains matrix and values

R = [1 0 0 0 0 0 ; 0 1 0 0 0 0 ; 0 0 1 0 0 0 ; 0 0 0 0 0 1];
r = [10000 ;  0 ; 0 ; 0];

temp1 = R*beta-r;
temp2 = var(y-x*beta)*R*(x'*x)^(-1)*R';
Wald = temp1'*temp2^(-1)*temp1;
pW = 1 - chi2cdf(Wald,length(r));

disp(['Wald test - p for relevant values is equal to ' num2str(pW)])


%% CREATE myttestfunc

function p = myttest(betas,se,n,k)
stat = betas./se;
p = 2 * (1 - tcdf(abs(stat), n-k));
end


%% CREATE FUNCTION (OLS)

function [betas,L,se] = OLS(X,Y)
betas = (X'*X)^(-1)*X'*Y;
e = Y - X*betas;
L = sum(e.^2);
normX = diag((X'*X)^-1);
se = sqrt(var(e).*normX);
end
