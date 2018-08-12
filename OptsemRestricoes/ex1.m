function [y,dy,hy]=ex1(x)
% y - valor da fun��o em x
% dy - valor do gradiente em x
y=0.5*(x(1)^2)*((x(1)^2)/6+1)+x(2)*atan(x(2))-0.5*log(x(2)^2+1);

if nargout > 1  
    dy=[1.0*x(1)*(x(1)^2/6 + 1) + 0.167*x(1)^3;atan(x(2))];
    if nargout > 2
        hy=[x(1)^2 + 1, 0 ; 0, 1/(x(2)^2 + 1)];
    end
end


% syms x y
% diff('0.5*(x^2)*((x^2)/6+1)+y*atan(y)-0.5*log(y^2+1)',x)
end