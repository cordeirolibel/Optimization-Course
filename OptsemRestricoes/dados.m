% Experiencias com fun��o objectivo com 2 vari�veis
x0=[1,0.7];
ex1(x0);

% fun��o fminunc sem op��es de entrada
%[x,fval,it]=metdm(@ex1,x0,10^-5,100);

% fun��o fminunc sem op��es de entrada
%x0 = [pi,pi];
%[x,fval,it]=metdm(@func,x0,10^-5,100);

% fun��o fminunc sem op��es de entrada
%[x,fval,exitflag,output,grad, hess]=fminunc(@ex1,x0)

% Metodo de Quasi-Newton com atualiza��o DFP 
%options = optimset('HessUpdate','steepdesc'); % 'dfp', 'steepdesc', 'bfgs'
%[x,fval,exitflag,output,grad,hessian]=fminunc(@ex1,x0,options)

% M�todo de Newton
%options = optimset('GradObj','on','Hessian','on');
%[x,fval,exitflag,output,grad,hessian]=fminunc(@ex1,x0,options)%

% M�todo Nelder-Mead
% fun��o fminsearch sem op��es de entrada
%[x,fval,exitflag,output]=fminsearch(@ex1,x0)

% fun��o fminsearch com op��es de entrada
options = optimset('TolFun',10^-10);%'MaxFunEvals',50,'MaxIter',100,...
%    'Display', 'Iter');
%[x,fval,exitflag,output]=fminsearch(@ex1,x0,options)%,
[x,fval]=fminsearch(@ex1,x0,options)

% fun��o fminunc com op��es de entrada
%options = optimset('MaxFunEvals',100,'TolFun',10^(-3));
%[x,fval,exitflag,output]=fminunc(@ex1,x0,options)
