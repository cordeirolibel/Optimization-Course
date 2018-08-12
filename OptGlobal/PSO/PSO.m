function [Y,Fy,k,tempo,kfun]=PSO(fun,imin,imax,n,Nvariaveis)
% Particle swarm optimization algorithm
%
% 

tic;

X=gerar(imin,imax,n,Nvariaveis);
vi=ones(size(X));


Fx=zeros((Nvariaveis+1),n);
Fx=X;


for i=1:n
    D=X(:,i);
   Fx((Nvariaveis+1),i)=fun(D);
end

P=Fx; %melhor posição inicial para todas as particulas.
p=P;
p((Nvariaveis+1),:)=[];


Pbest=min(Fx((Nvariaveis+1),:));

for i=1:n
    if Fx(Nvariaveis+1,i)==Pbest
        pbest=Fx(:,i);
    end
end
pbest((Nvariaveis+1))=[];

w=1;
c1=2;
c2=2;
r1=rand(1);
r2=rand(1);
Ffinal=zeros((Nvariaveis+1),n);

stop=0;
erromaxf=1e-6;
% erromaxx=1e-6;
kmax=100000;
kfun=1;
% Yk1=Pbest;
k=0;

while ~stop

    k=k+1;
    
    for i=1:n
    
        vi(:,i)=w*vi(:,i)+c1*r1*(p(:,i)-X(:,i))+c2*r2*(pbest-X(:,i));
        X(:,i)=X(:,i)+vi(:,i);
    
    end
    
    Ffinal=X;
    
    for i1=1:n
        D=X(:,i1);
       Ffinal((Nvariaveis+1),i1)=fun(D);
       kfun=kfun+1;
    end
    
    P2=Ffinal;
    
    for i2=1:n
        if P((Nvariaveis+1),i2)<Ffinal((Nvariaveis+1),i2)
            P2(:,i2)=P(:,i2);
        end
    end
    
    
    P=P2;
    p=P;
    p((Nvariaveis+1),:)=[];
    
    Pbest1=min(P((Nvariaveis+1),:));
    
    if Pbest1<Pbest
        Pbest=Pbest1;
        
        for i4=1:n
            if P(Nvariaveis+1,i4)==Pbest
            pbest=P(:,i4);
            end
        end
        
        pbest((Nvariaveis+1))=[];
        
    end
%     
%     Yk2=Pbest;
%     
%     errof=abs(Yk1-Yk2);
%     
    
    if k>kmax
        stop=1;
    end
    
    if Pbest<erromaxf
        stop=2;
    end
    
%     Yk1=Pbest;
%     
    
end
  
FY=min(P((Nvariaveis+1),:));
   
for i6=1:n
    if P(Nvariaveis+1,i6)==FY
        Y=P(:,i6);
        Y(Nvariaveis+1)=[];
    end
end



[Y,Fy,K,kfunP]=powell(fun,Y);
k=k+K;
kfun=kfun+kfunP;

tempo=toc;

