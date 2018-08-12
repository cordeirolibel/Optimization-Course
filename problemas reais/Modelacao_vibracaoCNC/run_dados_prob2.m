%%%%%%%%%% Problem 1
x0=ones(1,5); %%%%%%%%%% cuidado com o número de variáveis

[dados, Texto]=xlsread('CalcRMS.xlsx');

fun1(x0,dados,1);

fid2 = fopen('resultados M1 Linear.txt', 'a'); %o 'a' acrescenta os resultados
name='M1'; % alterar conforme medida
fun='fun1'; % alterar conforme funcao
nf=1;
nruns=5; % alterar para 50


fmint=[];
options=gaoptimset('HybridFcn',@fmincon);

for i=1:nruns

%[x,fval,exitflag,output]=fminsearch(@(x) fun1(x,dados),x0)
[xmin,fmin,exitflag,output]=ga(@(x)fun1(x,dados,nf),5,[],[],[],[],[],[],@nlc, options);

inf(i,:)=[fmin, xmin];


end


%analise

[menor,indexmenor]=min(inf(:,1)); %%minimo
media=mean(inf(:,1)) ;
xmin=inf(indexmenor,2:end)




%%%%%%%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%% Problema 2


z0=ones(1,4); %%%%%%%%%% cuidado com o número de variáveis
%plot(xdados,ydados,'-b',xdados,fun1b(x,xdados),'-r')

%Restrições lineares de desigualdade
A=[];
b=[];

%rRestrições lineares de igualdade
Aeq=[];
beq=[];

%limites simples
lb=[2546;1018.4;0.10;1];
ub=[3820;4584;0.35;2];


%options=optimset('Algorithm', 'interior-point');
%options=gaoptimset('PlotFcns',{@gaplotbestf,@gaplotstopping})
%[x,fval]=fmincon(@fun4,x0,A,b)
%[x,fval]=fmincon(@fun4,x0,A,b,Aeq,beq,lb,ub)
%[x,fval,exitflag,output]=ga(@fun2_t,6,A,b)

[z,fval,exitflag,output]=ga(@(z) fun2(xmin,z,nf),4,A,b,Aeq,beq,lb,ub)