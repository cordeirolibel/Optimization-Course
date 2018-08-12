fid2 = fopen('result_ga3652.txt', 'a'); %o 'a' acrescenta os resultados
name='Mregi�o1'; % alterar conforme regi�o
Ma=Mregiao1;  % alterar conforme regi�o


%%% Mudar a fun��o aqui e no ga!!!!!!
fun='fun1'; % alterar conforme funcao
fmint=[];
options=gaoptimset('HybridFcn',@sqp);

% normalizar a matriz - matriz de diferen�a de temperaturas
[nMa,mMa]=size(Ma);
A=[];
l=1;
for aa=1:nMa
    for bb=1:mMa
        if Ma(aa,bb)>0
            A(l)=Ma(aa,bb);
            l=l+1;
        end
    end
end

Mmin=min(A);
Mmax=max(A);

Manorm=Ma-Mmin; %matriz normalizada em que o Ma � o tamanho das matrizes normalizadas da temperatura e matriz 
%minima de A.

for aa=1:nMa
    for bb=1:mMa
        if Manorm(aa,bb)<0
            Manorm(aa,bb)=0;
        end
    end
end
%----------------- fim da normaliza��o da matriz


nruns=10;  % alterar para 10

tic
for i=1:nruns

 %%% MUDAR O NOME DA FUN�AO   
[xmin,fmin]=ga(@(x)fun1(x,Manorm),17,[],[],[],[],[],[],@nlc, options)  % alterar a fun��o

%podemos alterar o fun1
fprintf(fid2,'%s & ', name );
fprintf(fid2,'%s & ', fun );
fprintf(fid2,' & %6.5E  \\ \\ \n', fmin);
%fprintf(fid2,'%6.5E & %6.5E & %6.5E & %6.5E & %6.5E & %6.5E & %6.5E & %6.5E & %6.5E  \\ \\ \n', xmin);

fmint=[fmint fmin];

end
toc
time=toc/nruns



%analise

media=mean(fmint); %%media
desviop=std(fmint);
menor=min(fmint); %%minimo
fprintf(fid2,'%s & %3.2E & %4.3E & %4.3E & %4.3E \\ \\ \n ', name , time, media, desviop, menor);


fclose(fid2);

