function [y,kfun]=mutacao(fun,Ffinal,Ffinal2,Nvariaveis,n2,imin,imax,n1)

kfun=1;

  Ffinal21=[];

        for i2=1:n1
            Ffinal21=[Ffinal21,Ffinal(:,i2)];
        end
        Ffinal3=Ffinal21;
        Ffinal3((Nvariaveis+1),:)=[];
    
for i=1:n2
    pos=[randi([1 n1],1,1)];
    x=Ffinal3(:,pos);
    [l,c]=size(x);
    pos1=[randi([1 l],1,1)];
    iminx=imin(pos1);
    imaxx=imax(pos1);
    x(pos1)= iminx+(imaxx-iminx)*rand(1);
    x=[x;fun(x)];
    kfun=kfun+1;
    Ffinal2=[Ffinal2,x];
end

y=Ffinal2;