Number_pop=20;
%branin
n=2; % branin
lb = [-5; 0]';
ub = [10; 15]'; 
% GA tem 2 tipos de cruzamento {1,2}

[Y,Fy,xpoint,k,tempo,kfun]=GA(@branin,lb,ub,Number_pop,n,1)