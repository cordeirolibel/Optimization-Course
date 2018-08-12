function [xmin,fmin,it]=metdm(fun,x0,deps,kmax)
% M�todo de descida M�xima
%
% Par�metros de entrada: 
% fun - fun��o em ficheiro .m
% x0 - ponto inicial
% deps - valor m�ximo da norma 2 da derivada
% kmax - n�mero m�ximo de itera��es
%
% Par�metros de sa�da:
% xmin - minimizante
% fmin - minimo = f(xmin)
% it - n�mero de itera��es
%
%

[f,df]=fun(x0);
k=0;
while (norm(df)>deps)&&(k<kmax)
    p=-df;
    alfa=1;
    k=k+1; % nova itera��o
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
            