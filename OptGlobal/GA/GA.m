% min f(x)
% s.t. lb<=x<=ub

% fun - função objectivo
% imin - lb de x
% imax - ub de x
% Nvariaveis - n. de variáveis
% N - Number of elements in the population

function [Y,Fy,xpoint,k,tempo,kfun,stop]=GA(fun,imin,imax,n,Nvariaveis,CR)

% ----------------------
% Parameters
MAX_ITERATIONS=100;
MAX_FUNCCOUNT=1000;
LOCAL_ITERATIONS=10;
delta=1e-3;
%----------------
kfun=1;
k=0;
errof=0;
Errox=0;

t=0;
t1=0;
errofk=0;
Erroxk=0;

stop=0;

erromaxf=1e-6;
erromaxx=1e-6;
tic;
X=gerar(imin,imax,n,Nvariaveis);

Fx=zeros((Nvariaveis+1),n);
Fx=X;


for i=1:n
    D=X(:,i);
   Fx((Nvariaveis+1),i)=fun(D);
end

l=0;
Ffinal=zeros((Nvariaveis+1),n);
nn=n;
FXmin=Fx((Nvariaveis+1),:);
for j=n:-1:1
    Fbest=min(FXmin);
        for jj=nn:-1:1
             if Fx((Nvariaveis+1),jj)==Fbest
                 T=Fx(:,jj);   
                FXmin(jj)=[];
                Fx(:,jj)=[];
             end
        end
    nn=nn-1;
    l=l+1;
Ffinal(:,l)=T;       
end

n1=0.5*n;
n2=round(0.25*n);
n3=floor(0.25*n);

Yk1=Ffinal(:,1);
FYk1=fun(Yk1);

while ~stop
    
k=k+1;
    
if CR==1
    [Ffinal2, kfunC1]=cruzamento(fun,Ffinal,Nvariaveis,n2,n1);
    kfun=kfun+kfunC1;
elseif CR==2
    [Ffinal2, kfunC2]=cruzamento2(fun,Ffinal,Nvariaveis,n2,n1);
    kfun=kfun+kfunC2;    
end

[Ffinal2,kfunM]=mutacao(fun,Ffinal,Ffinal2,Nvariaveis,n3,imin,imax,n1);
kfun=kfun+kfunM;

Ffinal=zeros((Nvariaveis+1),n);
FXmin=Ffinal2((Nvariaveis+1),:);

nn=n;
for j=1:n
   
        for jj=nn:-1:1
             Fbest=min(FXmin);
             if Ffinal2((Nvariaveis+1),jj)==Fbest
                 T=Ffinal2(:,jj);   
                FXmin(jj)=[];
                Ffinal2(:,jj)=[];
                Ffinal(:,j)=T; 
                break
             end
        end
    nn=nn-1;
end

Yk2=Ffinal(:,1);
FYk2=fun(Yk2);
kfun=kfun+1;

errof=abs(FYk1-FYk2);
Errox=(Yk1-Yk2);
errox=norm(Errox,2);
%------------------------------------
% Stop criteria
if(k > MAX_ITERATIONS)
    stop=2; %max iterations
elseif(kfun > MAX_FUNCCOUNT)
    stop=3; %max iterations
end
%-------------------------------------



Yk1=Ffinal(:,1);
FYk1=fun(Yk1);
kfun=kfun+1;
end

Y=Ffinal(:,1);
Y(Nvariaveis+1)=[];
Fy=fun(Y);

[Y,Fy,kfunP] = local_to_best(Y, Fy, Nvariaveis,...
    imax, imin, kfun, LOCAL_ITERATIONS,delta,fun);
%[Y,Fy,K,kfunP]=powell(fun,Y);

kfun=kfun+kfunP;

tempo=toc;
xpoint=Ffinal(1:Nvariaveis,:)';
end
