function [rdes,rig]=nlcon3(x)

%nonlinear inequality constraints (<=0)
%rdes=[-x(1)-x(2)];
rdes=[]; % para fmincon

%nonlinear equality constraints (=0)
rig=[x(1)^2+x(2)^2-2];
end