function [y,dy,hy] = func2(x)
  
      y  = 0.5**x(1)**2*(x(1)**2/6+1)+x(2)*atan(x(2))-0.5*log(x(2)**2+1);
      
      if nargout > 1
          %gradiente
          dy = grad(@func2,x);
          if nargout > 2
              %hessiana
              hy = hessian(@func2,x);
          end
      end
end