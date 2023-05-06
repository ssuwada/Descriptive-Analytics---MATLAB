
%% REPORT TASK 2.1
clear;
clc;

 lags = 7;

%   Check if input is not a scalar, if yes change it into vector

 if isscalar(lags)
 lags = [1:lags];
 end

load('report_task.mat');
y=Y;
 [X,Y] = autoregressive(y,lags);
  
 [betas,L] = OLS(X,Y);
   
 BIC = bic2(L,length(y),max(lags));

 disp(['BIC for lag 7 = ' num2str(BIC)  ]);


%% LAST EXERCISE - nchoosek function

N = nchoosek(1:7,3); %list of possible lags, %3 variables - 3 zmienn dla lagu
 
 min2BIC = inf;
 comb = [];
 
 for i = 1:length(N)
        [X,Y] = autoregressive(y,N(i,:));
        [betas,L] = OLS(X,Y);
        BIC = bic2(L,length(Y),length(N(i,:)));
 
        if BIC < min2BIC
             min2BIC = BIC;
             comb = N(i,:);
        end    
 end

disp(['Minimum BIC = ' num2str(min2BIC)  ' Minimum combination -> ' num2str(comb)])

%   make loop -> for nchoosek and and in this loop we search for the best 
%   lags combination, so each row of matrix created of nchoosek have to be
%   put into autoregressive function for define lags row - czyli petla loop
%   dla kazdej wprowadzamy wiersz z N'a i sprawdzamy gdzie bedzie
%   najmniejsza wartosc BIC2


%%  AUTOREGRESSIVE FUNCTION
function [X,Y] = autoregressive(y,lags)

mmax = max(lags);
n = length(y) - mmax;

% Initialize matrix 

 X = zeros(n, length(lags));
 Y = zeros(n,1);

%   create matrix of new size
     Y = y((mmax + 1):end);

% lags is shift to the past

 for i = 1:length(lags)
        X(:,i) = y((mmax+1-lags(i)):end-lags(i));
 end

end

%% CREATE OTHER FILE OF THIS FUNCTION (OLS)

function [beta,L] = OLS(X,Y)
beta = (X'*X)^-1*X'*Y;
e = Y-X*beta;
L = e'*e;
end

%% Create BIC of regression model

%   BIC = n*log(RSS/n)+k*ln(n)
%   n - number of observation(len of y)
%   k - number of variables(lag number - 1)
%   RSS - loss function number(Loss function -> from OLS -> L)

function Bic = bic2(L,n,k)
Bic = n*log(L/n)+(k)*log(n);
end

%12
%136
