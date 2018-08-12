function y=fun(x,dados1,nf)

vr=dados1(:,2);%-Z(1)
va=dados1(:,3);%-Z(2)
pa=dados1(:,4);%-Z(3)
pr=dados1(:,5);%-Z(4)
m=dados1(:,10); % mudar para fazer estudo com outras medidas

switch nf
    case 1
        %linear
y=sum(((x(1).*vr+x(2).*va+x(3).*pa+x(4).*pr+x(5))-m).^2); % fun1
    case 2
    % quadrática
y=sum(((x(1).*vr.^2+x(2).*va.^2+x(3).*pa.^2+x(4).*pr.^2+x(5).*vr.*va+x(6).*vr.*pa+x(7).*vr.*pr+x(8).*va.*pa+x(9).*va.*pr+x(10).*pa.*pr+x(11).*vr+x(12).*va+x(13).*pa+x(14).*pr+x(15))-m).^2); 
    case 3
% quadrática incompleta
y=sum(((x(1).*vr.^2+x(2).*va.^2+x(3).*pa.^2+x(4).*pr.^2+x(5).*vr+x(6).*va+x(7).*pa+x(8).*pr+x(9))-m).^2); % quadrática incompleta
    case 4
% cúbica
y=sum(((x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr.^2+x(6).*va.^2+x(7).*pa.^2+x(8).*pr.^2+x(9).*vr.*va+x(10).*vr.*pa+x(11).*vr.*pr+x(12).*va.*pa+x(13).*va.*pr+x(14).*pa.*pr+x(15).*vr+x(16).*va+x(17).*pa+x(18).*pr+x(19))-m).^2);  
    case 5
% cúbica +
y=sum(((x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr.^2+x(6).*va.^2+x(7).*pa.^2+x(8).*pr.^2+x(9).*(vr.^2).*va+x(10).*(vr.^2).*pa+x(11).*(vr.^2).*pr+x(12).*(va.^2).*pa+x(13).*(va.^2).*pr+x(14).*(pa.^2).*pr+x(15).*vr.*va+x(16).*vr.*pa+x(17).*vr.*pr+x(18).*va.*pa+x(19).*va.*pr+x(20).*pa.*pr+x(21).*vr+x(22).*va+x(23).*pa+x(24).*pr+x(25))-m).^2); 
    case 6
% cúbica incompleta
y=sum(((x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr.^2+x(6).*va.^2+x(7).*pa.^2+x(8).*pr.^2+x(9).*(vr.^2).*va+x(10).*(vr.^2).*pa+x(11).*(vr.^2).*pr+x(12).*(va.^2).*pa+x(13).*(va.^2).*pr+x(14).*(pa.^2).*pr+x(15).*vr+x(16).*va+x(17).*pa+x(18).*pr+x(19))-m).^2); 
    case 7
% cúbica +incompleta
y=sum(((x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr.^2+x(6).*va.^2+x(7).*pa.^2+x(8).*pr.^2+x(9).*vr+x(10).*va+x(11).*pa+x(12).*pr+x(13))-m).^2); 
    case 8
% cúbica ++incompleta
y=sum(((x(1).*vr.^3+x(2).*va.^3+x(3).*pa.^3+x(4).*pr.^3+x(5).*vr+x(6).*va+x(7).*pa+x(8).*pr+x(9))-m).^2); 





%y=sum((x(1).*sin(x(2).*vr+x(3))+x(4).*cos(x(5).*vr+x(6))-ydados).^2);
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