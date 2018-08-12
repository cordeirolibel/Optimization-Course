function [x,fval,stop,k]=mpenl1(funobj,rest,x0)
% Método de penalidade l1
%
% Parâmetros de entrada:
% funobj - função objetivo em ficheiro .m
% rest - função restição em ficheiro .m [rdesigualdade,rigualdade]
% x0 - ponto inicial
%
% x - minimizante
% fval - minimo
% stop - motivo de paragem
% k - número de iterações
%
% Exemplo: [x,fval,stop,k]=mpenl1(@funobj,@rest,[1,1])
%
kmax=50; % número máximo de iterações
tolf=10^-6; % diferença max entre os valores da função
tolx=10^-6; % diferença max entre o vector x
tolmiu=10^-10;  % valor min para miu
miu=1; fvalant=1; xant=x0; 
nv=length(x0);
[ri,rd]=rest(x0);
nri=length(ri);
nrd=length(rd);
stop=0; k=0; c=0.7;
while ~stop
    k=k+1;    
    q=@(x) funobj(x)+(1/(miu))*summaxl1(rest,x);
    [x,fval]=fminsearch(q,x0)
    miu=c*miu;
    if k>=kmax
        stop=1;
    elseif abs(fvalant-fval)<tolf
        stop=2;
    elseif norm(xant-x)<tolx
        stop=3;
    elseif miu<tolmiu
        stop=4;
    end
    [ri,rd]=rest(x);
    infmin(k,1)=k;
    infmin(k,2:nv+1)=x;
    infmin(k,nv+2)=fval;
    infmin(k,nv+3:nv+nrd+2)=rd';
    infmin(k,nv+nrd+3:nv+nrd+nri+2)=ri';
    fvalant=fval;
    xant=x;
    x0=x;
end
infmin

end

