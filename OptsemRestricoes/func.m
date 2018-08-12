function [y,dy,hy] = func(x)
      
      %funcao
      y = (x(1)-3)**2+(x(2)-2)**2;
      if nargout > 1
          %gradiente
          dy = [2*(x(1)-3); 2*(x(2)-2)];
          if nargout > 2
              %hessiana
              hy = [2 0; 0 2];
          end
      end
end