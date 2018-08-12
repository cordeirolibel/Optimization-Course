fid2 = fopen('result_ga3688.txt', 'a'); %o 'a' acrescenta os resultados
name='Mregião6'; % alterar conforme região
Ma=Mregiao6;  % alterar conforme região


%%% Mudar a função aqui e no ga!!!!!!
fun='funabs4'; % alterar conforme funcao
fmint=[];
options=gaoptimset('HybridFcn',@fmincon);

% normalizar a matriz - matriz de diferença de temperaturas
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

Manorm=Ma-Mmin; %matriz normalizada em que o Ma é o tamanho das matrizes normalizadas da temperatura e matriz 
%minima de A.

for aa=1:nMa
    for bb=1:mMa
        if Manorm(aa,bb)<0
            Manorm(aa,bb)=0;
        end
    end
end
%----------------- fim da normalização da matriz


nruns=10;  % alterar para 10

tic
for i=1:nruns

 %%% MUDAR O NOME DA FUNÇAO   
[xmin,fmin]=ga(@(x)funabs4(x,Manorm),25,[],[],[],[],[],[],@nlc, options)  % alterar a função
%[x,fval] = ga(@fitnessfun,nvars,[],[],[],[],[],[],[],options)-funçao original
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

