clear all
clc

% inicializa a memoria lendo o modelo a partir do ficheiro STL
% Primeiro argumento é o nome do ficheiro, segundo argumento é zero se o
% ficheiro STL está em formato texto e 1 se é binário, e o terceiro
% argumento é o passo do fatiamento

matslicing('45_degree_short.stl',1,2);


% aproximação inicial
x=[50 50]';
xl=[0 0]';
xu=[180 180]';
[nl,nc]=size(xl);
% gera o ficheiro 'out.m' a partir da solução encontrada
%matslicing(x,'start.m');
%start % faz o plot do fatiamento



options=gaoptimset('HybridFcn',@fminsearch);

% usa o fminsearch para otimizar uma das funções objetivo 'objfun'
nruns=1; %10


tic
for i=1:nruns
    %[xxsol, sol(i,1), inf]=ga(@objfun,2)
    format long
    [xxsol, sol(i,1), stop,inf]=fminsearch(@objfun,x)  %nruns=1;
    sol(i,2)=xxsol(1);
    sol(i,3)=xxsol(2);
    sol(i,4)=inf.funcCount;
end
toc;

sol

time=toc/nruns


% gera o ficheiro 'out.m' a partir da solução encontrada
%matslicing(x,'out.m');
%out   % faz o plot do fatiamento
