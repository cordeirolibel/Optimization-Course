x0=ones(1,5); %%%%%%%%%% cuidado com o número de variáveis

[dados, Texto]=xlsread('CalcRMS.xlsx');

fun1(x0,dados,1)

fid2 = fopen('resultados M1 Linear.txt', 'a'); %o 'a' acrescenta os resultados
name='M1'; % alterar conforme medida
fun='fun1'; % alterar conforme funcao
nf=1;
nruns=5; % alterar para 50


fmint=[];
options=gaoptimset('HybridFcn',@fmincon);
tic
for i=1:nruns

%[x,fval,exitflag,output]=fminsearch(@(x) fun1(x,dados),x0)
[xmin,fmin,exitflag,output]=ga(@(x)fun1(x,dados,nf),5,[],[],[],[],[],[],@nlc, options);

fprintf(fid2,'%s & ', name );
fprintf(fid2,'%s & ', fun );
fprintf(fid2,' %6.5E & ', fmin);
fprintf(fid2,'%6.5E & %6.5E & %6.5E & %6.5E & %6.5E \\ \\ \n', xmin);

fmint=[fmint fmin];

end
toc
time=toc/nruns



%analise

media=mean(fmint) ; %%media
menor=min(fmint); %%minimo
fprintf(fid2,'resumo: %s & %s & %3.2E & %4.3E & %4.3E \\ \\ \n ', name , fun, time, media, menor);


fclose(fid2);

