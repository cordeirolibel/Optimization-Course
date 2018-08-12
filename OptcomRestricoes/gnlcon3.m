function [rig]=gnlcon3(x)

%nonlinear equality constraints (=0)
rig=[x(1)^2+x(2)^2-2];
end