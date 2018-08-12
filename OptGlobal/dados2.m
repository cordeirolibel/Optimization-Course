clear all;
pkg load ga;
pkg load optim;

% Experiencias com fun��o objectivo com 2 vari�veis
x0=[1;0.7];
ex2(x0);

% Genetic algorithm - fun��o ga sem op��es de entrada
%x = ga(@ex2,2)

% Matlab - Simulated annealing algorithm - fun��o simulannealbnd sem op��es de entrada
%x=simulannealbnd(@ex2,x0)

% Octave - Simulated annealing algorithm
vet = { [0;0],[100;100],10,10,0.5,10000,10,1e-2,1e-2,2,1};
[x, obj, convergence, details] = samin("ex2", {x0},vet); % � preciso adaptar ver samin_example

% Matlab - Particle swarm optimization - fun��o  particleswarm
%opt=optimoptions('particleswarm','PlotFcn',@pswplotbestf);
%[x,fval,exitflag,output] = particleswarm(@ex2,2,[],[],opt);
