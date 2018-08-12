function [y, kfun]=cruzamento2(fun,Ffinal,Nvariaveis,n2,n1)

kfun=1;
    

    Ffinal2=[];

        for i2=1:n1
            Ffinal2=[Ffinal2,Ffinal(:,i2)];
        end
        Ffinal3=Ffinal2;
    Ffinal3((Nvariaveis+1),:)=[];
    
     
     
   
 for i3=1:n2
        pos=[randi([1 n1],1,2)];
                if pos(1)==pos(2)
                    pos=[randi([1 n1],1,2)];
                end
         xi=Ffinal3(:,pos(1));
         x2i=Ffinal3(:,pos(2));
         pos1=randi([1 length(xi)]);
         x=xi;
        x2=x2i;
        x(pos1)=x2i(pos1);
        x2(pos1)=xi(pos1);
        
        if fun(x)<fun(x2)
        x=[x;fun(x)];
        Ffinal2=[Ffinal2,x];
        kfun=kfun+1;
        else
            x2=[x2;fun(x2)];
        Ffinal2=[Ffinal2,x2];
        kfun=kfun+1;
        end
 end
 
 y=Ffinal2;
