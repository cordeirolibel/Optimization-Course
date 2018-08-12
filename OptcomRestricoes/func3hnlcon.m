function rdes=func3hnlcon(x)

%nonlinear inequality constraints (<=0)
%rdes=[x(1)**2-x(2)]; % para fmincon
rdes=[x(1)**2-x(2); x(1)+2*x(2)-5;x(1)-4;-x(1)];

end