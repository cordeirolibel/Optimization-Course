function [x,fval,stop,k]=mpenquad(funobj,rest,x0)

% m�todo de penalidade quadratica
% Output
% x - minimizante; 
% fval - minimo; 
% stop - motivo de paragem; 
% k - itera��es
%
%Input
% funobj - ficheiro com fun��o objectivo; 
% rest - [rdes,rig] ficheiro com restri��es 
% x0 - ponto inicial



% variaveis a alterar se necess�rio
kmax=100; % n�mero m�ximo de itera��es
tolf=10^-6; % diferen�a max entre os valores da fun��o
tolx=10^-6; % diferen�a max entre o vector x
tolmiu=10^-10;  % valor minimo para miu
options=1; %1 resolve com fminsearch; 2 resolve com fminunc

miu=1; 
fvalant=1; 
xant=x0; 
nv=length(x0);
[rd,ri]=rest(x0);
nri=length(ri);
nrd=length(rd);
stop=0; k=0; c=0.7;
while ~stop
    k=k+1;    
    q=@(x) funobj(x)+(1/(2*miu))*summaxl3(rest,x);
    if options==1 
        [x,fval]=fminsearch(q,x0);
    else
        [x,fval]=fminunc(q,x0);
    end
    miu=c*miu;
    if k>=kmax  
        stop=1;  % Parou devido ao n�mero m�ximo de itera��es     
    elseif abs(fvalant-fval)<tolf
        stop=2;  % Parou devido ao valor minimo ser semelhante em itera��es sucessivas
     elseif norm(xant-x)<tolx
        stop=3;  % Parou devido � diferen�a dos minimizantes ser pequena em itera��es sucessivas
     elseif miu<tolmiu
        stop=4;  % Parou devido ao valor de miu ser pr�ximo de 0
    end
    fvalant=fval;
    xant=x;
    x0=x;
    [rd,ri]=rest(x);
    infmin(k,1)=k;
    infmin(k,2:nv+1)=x;
    infmin(k,nv+2)=fval;
    infmin(k,nv+3:nv+nrd+2)=rd';
    infmin(k,nv+nrd+3:nv+nrd+nri+2)=ri';
end % while
disp('k    x   f(x)   rd(x)   ri(x)')
infmin
end %function

% [x,fval,stop,k]=mpquad(@funobj,@rest,[1,1])