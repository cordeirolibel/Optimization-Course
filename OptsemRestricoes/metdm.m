function [xmin,fmin,it]=metdm(fun,x0,deps,kmax)
% Método de descida Máxima
%
% Parâmetros de entrada: 
% fun - função em ficheiro .m
% x0 - ponto inicial
% deps - valor máximo da norma 2 da derivada
% kmax - número máximo de iterações
%
% Parâmetros de saída:
% xmin - minimizante
% fmin - minimo = f(xmin)
% it - número de iterações
%
%

[f,df]=fun(x0);
k=0;
while (norm(df)>deps)&&(k<kmax)
    p=-df;
    alfa=1;
    k=k+1; % nova iteração
    for i=1:20
        x=x0+alfa*p'; % novo ponto
        [y,dy]=fun(x);
        if y<f
            break;
        else
            alfa=alfa/2;
        end
    end
    df=dy;
    f=y;
    x0=x;
end
xmin=x;
fmin=y;
it=k;

end
            