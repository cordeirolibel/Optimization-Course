
%options = optimset('GradObj','on','Hessian','on');
%[x,fval,exitflag,output,grad,hess] = fminunc(@func,[0,0],options)


x0 = [10,10];

%newton
options = optimset('GradObj','on','Hessian','on');
[x,fval,exitflag,output,grad,hess] = fminunc(@ex1,[0,0],options);


%quasi-newton
[x,fval,exitflag,output,grad,hess] = fminunc(@ex1,x0)

%gradiente
[x,fval,it]=metdm(@ex1,x0,10^-5,100)