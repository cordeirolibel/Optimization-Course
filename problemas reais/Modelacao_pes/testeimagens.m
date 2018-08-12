%function J=regiongrowing(I,x,y,reg_maxdist)
% This function performs "region growing" in an image from a specified
% seedpoint (x,y)
%
% J = regiongrowing(I,x,y,t) 
% 
% I : input image 
% J : logical output image of region
% x,y : the position of the seedpoint (if not given uses function getpts)
% t : maximum intensity distance (defaults to 0.2)
%
% The region is iteratively grown by comparing all unallocated neighbouring 
% pixels to the region. 
% The difference between a pixel's intensity value and the region's mean, 
% is used as a measure of similarity. The pixel with the smallest 
% difference measured this way is allocated to the respective region. 
% This process stops when the intensity difference between region mean and
% new pixel become larger than a certain treshold (t)
%
  function [Mregiao1, Mregiao2, Mregiao3, Mregiao4, Mregiao5, Mregiao6]=testeimagens(name)
  % [Mregiao1, Mregiao2, Mregiao3, Mregiao4, Mregiao5, Mregiao6]=testeimagens('Ir_3652')
t=sprintf('%s.mat', name);
%%
% 
%   for x = 1:10
%       disp(x)
%   end
% 
I=load(t);

% close all
% clc
I1=I.(name);
a=I1-273.15;

b=uint8(a);

J=imadjust(b);

Img = im2double(a);
Img2=Img;
maxp=max(max(a));
minp=min(min(a));
 %x=198; y=359;
% J = regiongrowing(I,x,y,0.2); 

% Author: D. Kroon, University of Twente

if(exist('reg_maxdist','var')==0) 
    reg_maxdist=3; %� possivel alterar este valor para 2.5, dependendo da imagem
end
if(exist('reg_maxdist2','var')==0) 
    reg_maxdist2=3; %� possivel alterar este valor para 2.5, dependendo da imagem
end
if(exist('y','var')==0), 
    figure, imshow(Img,[]); 
    [y,x]=getpts; 
    y=round(y(1));
    x=round(x(1));
    [y2,x2]=getpts;
    y2=round(y2(1));
    x2=round(x2(1));
end


J = zeros(size(Img)); % Output 
Isizes = size(Img); % Dimensions of input image
J2 = zeros(size(Img)); % Output 

reg_mean = Img(x,y); % The mean of the segmented region
reg_size = 1; % Number of pixels in region
reg_mean2 = Img(x2,y2); % The mean of the segmented region
reg_size2 = 1; % Number of pixels in region

% Free memory to store neighbours of the (segmented) region
neg_free = 1000000; neg_pos=0;
neg_list = zeros(neg_free,3);

neg_free2 = 1000000; neg_pos2=0;
neg_list2 = zeros(neg_free2,3);



pixdist=0;% Distance of the region newest pixel to the regio mean
pixdist2=0;

% Neighbor locations (footprint)
neigb=[-1 0; 1 0; 0 -1;0 1];

% Start regiogrowing until distance between region and possible new pixels 
% become higher than a certain treshold
while(pixdist<reg_maxdist&&reg_size<numel(Img))

    % Add new neighbors pixels
    for j=1:4,
        % Calculate the neighbour coordinate
        xn = x +neigb(j,1); yn = y +neigb(j,2);
        
        % Check if neighbour is inside or outside the image
        ins=(xn>=1)&&(yn>=1)&&(xn<=Isizes(1))&&(yn<=Isizes(2));
        % Add neighbor if inside and not already part of the segmented area
        if(ins&&(J(xn,yn)==0)) 
                neg_pos = neg_pos+1;
                neg_list(neg_pos,:) = [xn yn Img(xn,yn)]; J(xn,yn)=1;
        end
    end
    

    % Add a new block of free memory
    if(neg_pos+10>neg_free), neg_free=neg_free+1000000; neg_list((neg_pos+1):neg_free,:)=0; end
    
    % Add pixel with intensity nearest to the mean of the region, to the region
    dist = abs(neg_list(1:neg_pos,3)-reg_mean);
    [pixdist, index] = min(dist);
    J(x,y)=2; reg_size=reg_size+1;
    
    % Calculate the new mean of the region
    reg_mean= (reg_mean*reg_size + neg_list(index,3))/(reg_size+1);
    
    % Save the x and y coordinates of the pixel (for the neighbour add process)
    x = neg_list(index,1); y = neg_list(index,2);
    
    % Remove the pixel from the neighbour (check) list
    neg_list(index,:)=neg_list(neg_pos,:); neg_pos=neg_pos-1;
        % Add a new block of free memory
end

while(pixdist2<reg_maxdist2&&reg_size2<numel(Img))

    % Add new neighbors pixels
    for j=1:4,
        % Calculate the neighbour coordinate
        xn2 = x2 +neigb(j,1); yn2 = y2 +neigb(j,2);
        
        % Check if neighbour is inside or outside the image
        ins2=(xn2>=1)&&(yn2>=1)&&(xn2<=Isizes(1))&&(yn2<=Isizes(2));
        
        % Add neighbor if inside and not already part of the segmented area
          if(ins2&&(J2(xn2,yn2)==0)) 
                neg_pos2 = neg_pos2+1;
                neg_list2(neg_pos2,:) = [xn2 yn2 Img(xn2,yn2)]; J2(xn2,yn2)=1;
        end
    end
    
    
    
    if(neg_pos2+10>neg_free2), neg_free2=neg_free2+1000000; neg_list2((neg_pos2+1):neg_free2,:)=0; end
    
    % Add pixel with intensity nearest to the mean of the region, to the region
    dist2 = abs(neg_list2(1:neg_pos2,3)-reg_mean2);
    [pixdist2, index2] = min(dist2);
    J2(x2,y2)=2; reg_size2=reg_size2+1;
    
    % Calculate the new mean of the region
    reg_mean2= (reg_mean2*reg_size2 + neg_list2(index2,3))/(reg_size2+1);
    
    % Save the x and y coordinates of the pixel (for the neighbour add process)
    x2 = neg_list2(index2,1); y2 = neg_list2(index2,2);
    
    % Remove the pixel from the neighbour (check) list
    neg_list2(index2,:)=neg_list2(neg_pos2,:); neg_pos2=neg_pos2-1;
end
% Return the segmented area as logical matrix
J=J>1;
J2=J2>1;
% figure, imshow(Img+J+J2,[]);
figure
subplot(2,2,[1,3])
imshow(Img+J+J2,[]);
ttt=Img+J+J2;
min(min(ttt));

espe=J+J2;

[l,c]=size(espe);
for i=1:l
    for j=1:c
        FFF=espe(i,j);
        if FFF~=0
            matriz(i,j)=Img(i,j);
        else
            matriz(i,j)=0;
        end
    end
end


% figure, imshow(J+J2,[]); 
subplot(2,2,[2,4])
 imshow(J+J2,[]);
  %colormap(jet)
[linha,coluna]=size(matriz);
for i=1:linha
    for j=1:coluna
        teste=matriz(i,j);
        if teste<25
            matriz(i,j)=0;
        else 
            matriz(i,j)=(matriz(i,j)-25)*((255-50)/(35-20))+50;
        end
    end
end

figure, imshow(matriz,[]);   
colormap(jet)

%||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
%||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


matrizfinal=[];

for i=1:linha
    for j=1:coluna
        valor1=matriz(i,j);
        valor2=Img(i,j);
        if valor1==0
            matrizfinal(i,j)=matriz(i,j);
        else if valor1~=0
                matrizfinal(i,j)=valor2;
            end
        end
    end
end

meio=round(coluna/2);

for i=1:linha
    t=1:meio;
    valorabs=max(matrizfinal(i,t));
 if valorabs~=0
     linhainicial1=i;
     break
 end
end

for i=1:linha
    t2=meio:coluna;
    valorabs1=max(matrizfinal(i,t2));
 if valorabs1~=0
     linhainicial2=i;
     break
 end
end

for i=linha:-1:1
    t3=1:meio;
    valorabs2=max(matrizfinal(i,t3));
 if valorabs2~=0
     linhafinal1=i;
     break
 end
 end

for i=linha:-1:1
 t4=meio:coluna;
    valorabs2=max(matrizfinal(i,t4));
 if valorabs2~=0
     linhafinal2=i;
     break
 end
end


linhas1=round((linhafinal1-linhainicial1)/3);
linhas2=round((linhafinal2-linhainicial2)/3);




for j=1:meio
    valorabs3=max(matrizfinal(:,j));
    if valorabs3~=0
        linhainicialpe1=j;
        break
    end
end

for j=meio:-1:1
    valorabs4=max(matrizfinal(:,j));
    if valorabs4~=0
        linhafinalpe1=j;
        break
    end
end

for j=meio:coluna
    valorabs5=max(matrizfinal(:,j));
    if valorabs5~=0
        linhainicialpe2=j;
        break
    end
end

for j=coluna:-1:meio
    valorabs6=max(matrizfinal(:,j));
    if valorabs6~=0
        linhafinalpe2=j;
        break
    end
end

%\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Mregiao1=[];
regiao1=[];
regiao12=[];

for i=linhainicial1:(linhainicial1+linhas1)
    for j=linhainicialpe1:linhafinalpe1
       regiao1=[regiao1, matrizfinal(i,j)];  
       regiao12=[regiao12,matrizfinal(i,j)];
    end   
     Mregiao1=[Mregiao1;regiao12];
    regiao12=[];
end



regiao1final=[];
[c,l1]=size(regiao1);
for i=1:l1 
        if regiao1(i)~=0
            regiao1final=[regiao1final, regiao1(i)];
        end
end

minimoregiao1=min((regiao1final));
maxregiao1=max((regiao1final));
mediaregiao1=mean((regiao1final));
desviopadrao=std(regiao1final);



Mregiao2=[];
regiao2=[];
regiao22=[];

for i=(linhainicial1+linhas1+1):(linhainicial1+(linhas1*2))
    for j=linhainicialpe1:linhafinalpe1
       regiao2=[regiao2, matrizfinal(i,j)];
        regiao22=[regiao22,matrizfinal(i,j)];
    end
         Mregiao2=[Mregiao2;regiao22];
    regiao22=[];
end


regiao2final=[];
[c,l2]=size(regiao2);
for i=1:l2 
        if regiao2(i)~=0
            regiao2final=[regiao2final, regiao2(i)];
        end
end

minimoregiao2=min((regiao2final));
maxregiao2=max((regiao2final));
mediaregiao2=mean((regiao2final));
desviopadrao2=std(regiao2final);


regiao3=[];
Mregiao3=[];
regiao32=[];


for i=(linhainicial1+((linhas1*2)+1)):linhafinal1
    for j=linhainicialpe1:linhafinalpe1
     regiao3=[regiao3, matrizfinal(i,j)];
      regiao32=[regiao32,matrizfinal(i,j)];
    end
         Mregiao3=[Mregiao3;regiao32];
    regiao32=[];
end


regiao3final=[];
[c,l3]=size(regiao3);
for i=1:l3 
        if regiao3(i)~=0
            regiao3final=[regiao3final, regiao3(i)];
        end
end

minimoregiao3=min((regiao3final));
maxregiao3=max((regiao3final));
mediaregiao3=mean((regiao3final));
desviopadrao3=std(regiao3final);

regiao4=[];
Mregiao4=[];
regiao42=[];

for i=linhainicial2:(linhainicial2+linhas2)
    for j=linhainicialpe2:linhafinalpe2
       regiao4=[regiao4, matrizfinal(i,j)];
       regiao42=[regiao42,matrizfinal(i,j)];
    end
         Mregiao4=[Mregiao4;regiao42];
    regiao42=[];
end


regiao4final=[];
[c,l4]=size(regiao4);
for i=1:l4 
        if regiao4(i)~=0
            regiao4final=[regiao4final, regiao4(i)];
        end
end

minimoregiao4=min((regiao4final));
maxregiao4=max((regiao4final));
mediaregiao4=mean((regiao4final));
desviopadrao4=std(regiao4final);


regiao5=[];
Mregiao5=[];
regiao52=[];

for i=(linhainicial2+linhas2+1):(linhainicial2+(linhas2*2))
    for j=linhainicialpe2:linhafinalpe2
       regiao5=[regiao5, matrizfinal(i,j)];
       regiao52=[regiao52,matrizfinal(i,j)];
    end
         Mregiao5=[Mregiao5;regiao52];
    regiao52=[];
end


regiao5final=[];
[c,l5]=size(regiao5);
for i=1:l5 
        if regiao5(i)~=0
            regiao5final=[regiao5final, regiao5(i)];
        end
end

minimoregiao5=min((regiao5final));
maxregiao5=max((regiao5final));
mediaregiao5=mean((regiao5final));
desviopadrao5=std(regiao5final);


regiao6=[];
Mregiao6=[];
regiao62=[];

for i=(linhainicial2+((linhas2*2)+1)):linhafinal2
    for j=linhainicialpe2:linhafinalpe2
       regiao6=[regiao6, matrizfinal(i,j)];
       regiao62=[regiao62,matrizfinal(i,j)];
    end
       Mregiao6=[Mregiao6;regiao62];
       regiao62=[];
end


regiao6final=[];
[c,l6]=size(regiao6);
for i=1:l6 
        if regiao6(i)~=0
            regiao6final=[regiao6final, regiao6(i)];
        end
end

minimoregiao6=min((regiao6final));
maxregiao6=max((regiao6final));
mediaregiao6=mean((regiao6final));
desviopadrao6=std(regiao6final);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



fid=fopen('resultados.txt','a');

fprintf(fid,'m�nimo\t');
fprintf(fid,'m�ximo\t');
fprintf(fid,'m�dia\t');
fprintf(fid,'desvio padr�o\n');

fprintf(fid,'%d\t',minimoregiao1);
fprintf(fid,'%d\t',maxregiao1);
fprintf(fid,'%d\t',mediaregiao1);
fprintf(fid,'%d\n',desviopadrao);

fprintf(fid,'%d\t',minimoregiao2);
fprintf(fid,'%d\t',maxregiao2);
fprintf(fid,'%d\t',mediaregiao2);
fprintf(fid,'%d\n',desviopadrao2);

fprintf(fid,'%d\t',minimoregiao3);
fprintf(fid,'%d\t',maxregiao3);
fprintf(fid,'%d\t',mediaregiao3);
fprintf(fid,'%d\n',desviopadrao3);

fprintf(fid,'%d\t',minimoregiao4);
fprintf(fid,'%d\t',maxregiao4);
fprintf(fid,'%d\t',mediaregiao4);
fprintf(fid,'%d\n',desviopadrao4);

fprintf(fid,'%d\t',minimoregiao5);
fprintf(fid,'%d\t',maxregiao5);
fprintf(fid,'%d\t',mediaregiao5);
fprintf(fid,'%d\n',desviopadrao5);


fprintf(fid,'%d\t',minimoregiao6);
fprintf(fid,'%d\t',maxregiao6);
fprintf(fid,'%d\t',mediaregiao6);
fprintf(fid,'%d\n',desviopadrao6);
fclose(fid);

A=Mregiao1;
B=Mregiao2;
C=Mregiao3;
D=Mregiao4;
E=Mregiao5;
F=Mregiao6;

  end
% [Mregiao1, Mregiao2, Mregiao3, Mregiao4, Mregiao5, Mregiao6]=testeimagens2('Ir_0122')
