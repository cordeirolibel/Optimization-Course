
close all;
%clear all;
%load "teste.mat"

Ma = Mregiao1;
[nMa,mMa]=size(Ma);

%===============================
%======== Normalizando 
%===============================

%--------------------------------------------------------------------
%---------------  Transformando imagem em vetor

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

Mmin=min(A); %minimo nao sendo zero
Mmax=max(A);
%matriz normalizada em que o Ma � o tamanho das
% matrizes normalizadas da temperatura e matriz.
Manorm=Ma-Mmin; 

%-----------------------------------------------------------------------
%---------------  ajustando fundo (que esta negativo)

for aa=1:nMa
    for bb=1:mMa
        if Manorm(aa,bb)<0
            Manorm(aa,bb)=0;
        end
    end
end

%===========================
%======= Plot =================
%===========================

%--------------------------------------------------------
%----------- Funcao de Plot
function plotPe(im_esperada,im_obtida,titulo)
     
    %escala da imagem de variacoes
    escala = [0,max(max(im_esperada))];
    
    %====> Imagem original
    subplot (2, 2,1)    
    
    imagesc(im_esperada);
    title ("Imagem Esperada");
    set(gca, 'box', 'off')
    %====> Imagem obtida
    subplot (2, 2,  2)
    imagesc(im_obtida);
    title ("Imagem Obtida");
    
    %====> Imagem obtida
    subplot (2, 2,  3)    
    imagesc(im_obtida,clim=escala);
    title ("Imagem Obtida com Escala");
    
    %====> Imagem de Erro
    im_erro = (im_esperada-im_obtida).^2;
    erro = sum(sum(im_erro));
    printf("Erro Imagem: %s: %.2f\n",titulo,erro);
    subplot (2, 2, 4)      
    imagesc(im_erro,clim = escala.^2);
    title ("Imagem de Erro");

end

fig_k = 1

%--------------------------------------------------------------------
%--------------- Imagem para a Media

im_med = ones([nMa,mMa]);
im_med *= mean(mean(Manorm));

figure(fig_k++)
plotPe(Manorm,im_med,"Media")

%--------------------------------------------------------------------
%--------------- Imagem para a funcao

xmin = [ 0.0000    0.0789   -0.0790    0.1278    0.0001    0.2083  ...
              -0.9418    1.1663   -0.0000    0.0973   -0.3098    0.3191  ...
              -0.0000    0.5533   -0.1664    0.1060    0.0002];
              
[im_fun,im_erro] = fun1im(xmin,Manorm);

figure(fig_k++)
plotPe(Manorm,im_fun,"Funcao ruim")

%--------------------------------------------------------------------
%--------------- Imagem para a funcao 2

xmin =  [-1.1824   -6.3072   22.0876   -3.3859   -5.0811   15.7346 ...
               28.3061  -13.0665    1.3750   -6.1913   62.9468  -15.6910 ...
               2.4551  -18.8882   69.1696  -12.7983    3.9635];
              
[im_fun,im_erro] = fun1im(xmin,Manorm);

figure(fig_k++)
plotPe(Manorm,im_fun,"Funcao boa")
%print ('saida','-djpg');

%--------------------------------------------------------------------
%--------------- Imagem para a funcao 3

xmin = [0.4568    6.1767   40.8655  -18.1281   -2.6541   53.3656    9.5466   27.9319    1.5662   37.7791   62.6076   52.2286    3.0863 ...
-12.5498   -0.0530    0.6755    0.8348  -44.5958   39.9631   69.3941  -56.6940   -6.5441  -37.2571   -0.3751   -0.4127   14.6761 ...
 44.0044  -12.5832  -18.7497    0.2853   -2.5460];
              
[im_fun2,im_erro] = fun2im(xmin,Manorm);

figure(fig_k++)
plotPe(Manorm,im_fun2,"Funcao boa 2")
print ('saida2','-djpg');