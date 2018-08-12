clear all;

%x0=[0,0];
x0=[0;0];

% M�todo de penalidade l1
%[x,fval,stop,k]=mpenl1(@ex3,@nlcon3,x0)

% M�todo de penalidade quadr�tica
%[x,fval,stop,k]=mpenquad(@ex3,@nlcon3,x0)
%[x,fval,stop,k]=mpenquad(@func3,@func3cond,x0)

%%%%%%%%%%%%%%%%%%% MATLAB - fun��o fmincon
% %restri��es lineares de desigualdade 
% A=[-1 -1];  
% b=[0];
% 
% %restri��es lineares de igualdade 
% Aeq=[];
% beq=[];
% 
% %limites simples
% lb=[-inf;-inf];
% ub=[inf;inf];
% 
% %options = optimset('Algorithm','interior-point');
% [x,fval]=fmincon(@ex3,x0,A,b)
% %[x,fval]=fmincon(@ex3,x0,A,b,Aeq,beq,lb,ub)
% %[x,fval,exitflag,output]=fmincon(@ex3,x0,A,b,Aeq,beq,lb,ub,@nlcon3)



% %%%%%%%%%%%%%%%% OCTAVE - fun��o sqp
% [x, obj, info, iter, nf, lambda] = sqp (x0, @ex3)
% [x, obj, info, iter, nf] = sqp (x0, @ex3, @gnlcon3, @hnlcon3)  % g e h em fun��o .m e g=0 e h>=0
 
 
 %[x, obj, info, iter, nf, lambda] = sqp (x0, @func3)
[x, obj, info, iter, nf] = sqp (x0, @func3, @func3gnlcon, @func3hnlcon) 
