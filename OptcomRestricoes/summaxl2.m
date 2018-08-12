function z=summaxl2(rest,x)

[rdes,rigu]=rest(x);
y=sum(rigu.^2); % soma das restrições de igualdade
z=sum(max(rdes,0).^2);
z=z+y;
end