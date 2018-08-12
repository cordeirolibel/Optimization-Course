function z=summaxl3(rest,x)

[rdes,rigu]=rest(x);
y=sum(rigu.^4); % soma das restri��es de igualdade
z=sum(max(rdes,0).^4);
z=z+y;
end