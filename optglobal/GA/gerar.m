function y=gerar(imin,imax,n,Nvariaveis)

% y - Nvariaveis*Number_pop
y=zeros(Nvariaveis,n);

for i=1:n
    for j=1:Nvariaveis
        Min=imin(j);
        Max=imax(j);
        y(j,i)= Min+(Max-Min)*rand(1);
    end
end


