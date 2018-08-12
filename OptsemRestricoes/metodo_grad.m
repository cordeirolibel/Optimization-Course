
x = [0;0];

for k = 1:10
    
    [y,dy,hy] = func(x);
    
    %procurando alfa
    alfa = 1;
    for i=1:20
       new_x = x-dy*alfa;
       [new_y,new_dy,new_hy] = func(new_x);
       % termina se estou minimizando
       if y >  new_y
         x = new_x;
         break;
       end
       alfa = alfa*0.51;
     end
     x
     alfa
      
     % termina para gradiente = 0
     dy = new_dy;
     norm(dy)
     if norm(dy) < 1e-4
       break
     end
     
end

