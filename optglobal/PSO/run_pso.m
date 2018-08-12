Number_pop=20;

%branin
Nvariaveis=2; % branin
lb = [-5; 0]';
ub = [10; 15]'; 

[Y,Fy,k,tempo,kfun]=PSO(@branin,lb,ub,Number_pop,Nvariaveis)