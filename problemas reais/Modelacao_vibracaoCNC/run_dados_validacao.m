%%%%%%%%%% Problem 1
clear all;
[dados,texto1]=xlsread('CalcRMS.xlsx');


fid2 = fopen('resultados.txt', 'a'); %o 'a' acrescenta os resultados
name='M1'; % alterar conforme medida
fun='fun1'; % alterar conforme funcao
nf=1;
med=10; %%% de acordo com a TabelaValidacao  -> coluna da medida a considerar

nruns=5; % alterar para 100

fmint=[];
options=gaoptimset('HybridFcn',@fmincon);
switch nf
    case 1
        nv=5;
    case 2
        nv=15;
    case 3
        nv=9;
    case 4
        nv=19;
    case 5
        nv=25;
    case 6
        nv=19;
    case 7
        nv=13;
    case 8
        nv=9;
end
x0=ones(1,nv);

for i=1:nruns

%[x,fval,exitflag,output]=fminsearch(@(x) fun1(x,dados),x0)
[xmin,fmin,exitflag,output]=ga(@(x) fun1(x,dados,nf),nv,[],[],[],[],[],[],@nlc, options);
inf(i,:)=[fmin, xmin];

end
[menor,indexmenor]=min(inf(:,1)); %%minimo
media=mean(inf(:,1));

xmin=inf(indexmenor,2:nv+1)

fprintf(fid2,'resumo prob 1: %s & ', name );
fprintf(fid2,'%s & ', fun );
fprintf(fid2,' %6.5E & ', menor);
fprintf(fid2,' %6.5E & ', media);
fprintf(fid2,'%6.5E & ', xmin);
fprintf(fid2,'\\ \\ \n', xmin);

%%%%%%%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%% Validacao

[dados, Texto]=xlsread('TabelaValidacao.xlsx');
%fid2 = fopen('resultados quad prob 2.txt', 'a'); %o 'a' acrescenta os resultados
%name='M1'; % alterar conforme medida
%fun='fun2'; % alterar conforme funcao
%nruns=100; % alterar para 50


z=dados(:,3:6)


[nx,ny]=size(z)

for i=1:nx
    ynov(i)=fun2(xmin,z(i,:),nf)
end

% Calcula o ERRO 
erro=abs(dados(:,med)-ynov') %mudar por causa do excel conforme medida
soma=sum(erro) % erro absoluto total
%%%%%%%%- > conseguem calcular o erro relativo e o erro quadrático??? ;-)

% Faz o gráfico do erro  
plot(1:16,erro)

% Faz também o gráfico dos valores da medida e de ynov... para comparar -> conseguem?



fprintf(fid2,'Validacao: %s & ', name );
fprintf(fid2,'%s & ', fun );
fprintf(fid2,' %6.5E \\ \\ \n ', soma);

fclose(fid2)

