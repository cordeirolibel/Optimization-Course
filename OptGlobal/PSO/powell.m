function [Y,FY,k,kfun]=powell(fun,x0)

tStart=tic;

    
xf=x0;
[n,c]=size(xf);
df=eye(n);
FY1=fun(x0);
kfun=1;
stop=0;
k=0;

while ~stop
    k=k+1;
    for i=1:n
        y=@(alfa)fun(xf+alfa.*df(:,i));
        [alfa, fa] = fminbnd(y,-10,10);
        if abs(alfa)<=1e-6
            alfa=1;
        end
        xf=xf+alfa.*df(:,i);
        df(:,i)=alfa*df(:,i);
    end 
    kfun=kfun+1;

    [l,c]=size(df);
    soma=zeros(l,1);
    for i1=1:n
        soma=soma+df(:,i1);
    end
    H=df;
    for i2=1:(n-1)
        df(:,i2)=H(:,(i2+1));
    end
    df(:,n)=soma;
    
Y=xf;
FY=fun(Y);
kfun=kfun+1;
T=abs(FY1-FY);
if T<=1e-6
    stop=1;
else
    FY1=FY;
end

if toc(tStart)>= 2400
    12
    fid = fopen('resultados.txt','a');
    fprintf(fid,'Parou!!\n');
    fclose(fid);
        break
    end


end
time=toc;
