%% LAB 5


%%  Report Task

clear;

%   • To compute the LS loss function of non-linear model

%   y = a1*x1^(a2)*x2^(a3) + ε

load("model2_1.mat");

loss = task(y,x,a);

%   • To find vector a that minimize LS loss function. Assume that each element ai ∈ (−2, 2)

fl = for_loop(y,x);

%% Functions


%%   LS loss function of non-linear model
  
function L = task(y,x,a)
x1 = x(:,1);
x2 = x(:,2);
a1 = a(1);
a2 = a(2);
a3 = a(3);
e = y - a1.*x1.^(a2).*x2.^(a3);
L = e'*e; %sum(e.^2);
end

%%  Iteration searching for best value of a1,a2,a3 thats decide of loss value. 


function fl = for_loop(y,x)

Lmin = inf();

for a1=-2:0.1:2     
    for a2=-2:0.1:2
        for a3=-2:0.1:2
            L = task(y,x,[a1,a2,a3]);
            if L < Lmin
                Lmin = L;
                v = [a1,a2,a3];
            end
        end
    end
end

disp(['L value is equal to ' num2str(L)])
disp(['Best combination for Loss value is equal to ' num2str(v)])

fl = v;

end