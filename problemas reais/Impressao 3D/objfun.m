function f=objfun(x)

% optimizing the first objective function
%f=matslicing(x,1); %%%% coloquei - tb coloquei x'
[l,c]=size(x);
if l==1
    f=matslicing(x',1);
else
    f=matslicing(x,1); %%%% coloquei - tb coloquei x'
end

end