function [y,gy,hy] = fun1b(x)
  y=(x(1)-3)^2+(x(2)-2)^2;
  
  if nargout > 1
       gy=[2*(x(1)-3);2*(x(2)-2)]; % gradient
       if nargout > 2
           hy=[2,0;0,2]; % hessian matrix
       end
   end
end
