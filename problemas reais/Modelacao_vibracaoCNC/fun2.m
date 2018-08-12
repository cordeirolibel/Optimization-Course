function y=fun2(x,z,nf)

vr=z(1);
va=z(2);
pa=z(3);
pr=z(4);


switch nf 
    case 1
%Independente
y=abs(x(1).*vr+x(2).*va+x(3).*pa+x(4).*pr+x(5)); % fun1
    case 2
% quadrática
y=abs(x(1).*vr.^2+x(2).*va.^2+x(3).*pa.^2+x(4).*pr.^2+x(5).*vr.*va+x(6).*vr.*pa+x(7).*vr.*pr+x(8).*va.*pa+x(9).*va.*pr+x(10).*pa.*pr+x(11).*vr+x(12).*va+x(13).*pa+x(14).*pr+x(15)); 
    case 3
% quadrática incompleta
y=abs(x(1).*vr.^2+x(2).*va.^2+x(3).*pa.^2+x(4).*pr.^2+x(5).*vr+x(6).*va+x(7).*pa+x(8).*pr+x(9)); % quadrática incompleta
    case 4
% cúbica %todos tem q começar c abs
y=abs(x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr.^2+x(6).*va.^2+x(7).*pa.^2+x(8).*pr.^2+x(9).*vr.*va+x(10).*vr.*pa+x(11).*vr.*pr+x(12).*va.*pa+x(13).*va.*pr+x(14).*pa.*pr+x(15).*vr+x(16).*va+x(17).*pa+x(18).*pr+x(19));  
    case 5
% cúbica +
y=abs(x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr.^2+x(6).*va.^2+x(7).*pa.^2+x(8).*pr.^2+x(9).*(vr.^2).*va+x(10).*(vr.^2).*pa+x(11).*(vr.^2).*pr+x(12).*(va.^2).*pa+x(13).*(va.^2).*pr+x(14).*(pa.^2).*pr+x(15).*vr.*va+x(16).*vr.*pa+x(17).*vr.*pr+x(18).*va.*pa+x(19).*va.*pr+x(20).*pa.*pr+x(21).*vr+x(22).*va+x(23).*pa+x(24).*pr+x(25)); 
    case 6
% cúbica incompleta
y=abs(x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr.^2+x(6).*va.^2+x(7).*pa.^2+x(8).*pr.^2+x(9).*(vr.^2).*va+x(10).*(vr.^2).*pa+x(11).*(vr.^2).*pr+x(12).*(va.^2).*pa+x(13).*(va.^2).*pr+x(14).*(pa.^2).*pr+x(15).*vr+x(16).*va+x(17).*pa+x(18).*pr+x(19)); 
    case 7
% cúbica +incompleta
y=abs(x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr.^2+x(6).*va.^2+x(7).*pa.^2+x(8).*pr.^2+x(9).*vr+x(10).*va+x(11).*pa+x(12).*pr+x(13)); 
    case 8
% cúbica ++incompleta
y=sum(x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr+x(6).*va+x(7).*pa+x(8).*pr+x(9)); 





%y=sum((x(1).*sin(x(2).*vrd+x(3))+x(4).*cos(x(5).*vrd+x(6))-ydados).^2);
%% 6

%y=sum((x(1).*sin(x(2).*xdados+x(3))+x(4).*sin(x(5).*xdados+x(6))-ydados).^2);
%% 6

%y=sum((x(1).*cos(x(2).*xdados+x(3))+x(4).*cos(x(5).*xdados+x(6))-ydados).^2);
%% 6

%y=sum((x(1).*sin(x(2).*xdados)+x(3).*cos(x(4).*xdados)-ydados).^2); % 4

%y=sum((x(1).*sin(x(2).*xdados)+x(3).*sin(x(4).*xdados)-ydados).^2); % 4

%y=sum((x(1).*cos(x(2).*xdados)+x(3).*sin(x(4).*xdados)-ydados).^2); % 4

end
end