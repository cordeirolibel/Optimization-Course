function G = grad(f,varlist)
%gradient(f)
%Finds the Gradient vector symbolically for symbolic input function f.
%To use it, type syms <variables>.
%for example:
%syms x y
%f = 3*x*y^2
%
%grad(f,[x y])
%ans =
%[ 3*y^2]
%[ 6*x*y]
%(c) Ana Pereira 2009. Feel free to use this under the GPL guidelines. If
%you wish to add to this program, just leave my name and add yours to it.
n = numel(varlist);
gr =vpa(ones(n,1));

for i = 1:n;
        gr(i) = diff(f,varlist(i),1);
end
G=gr;