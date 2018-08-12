

function [mapa,erro]=fun2im(x,mat)

    re=mat;
    [c,l]=size(re); %tamanho da matriz


    for i=1:c
        for j=1:l
            mapa(i,j) =  x(1)*(sin((x(2)*i)+(x(3)*j)+x(4))).^2 + x(5)*(cos((x(6)*i)+(x(7)*j)+x(8))).^2 + ...
            x(9)*(sin((x(10)*i)+(x(11)*j)+x(12))) + x(13)*(cos((x(14)*i)+(x(15)*j)+x(16))) + x(17) + ...
            x(30)*tanh(x(18)*i+x(19)*j+x(20))*(sin((x(21)*i)+(x(22)*j)+x(23))) +x(31)* tanh(x(24)*i+x(25)*j+x(26))*(cos((x(27)*i)+(x(28)*j)+x(29)));
            
            erro(i,j) = (re(i,j)-mapa(i,j))**2;
        end 
    end

end