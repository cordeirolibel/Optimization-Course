function y=summaxl1(rest,x)

[rdes,rigu]=rest(x);
y=sum(abs(rigu));
z=sum(max(rdes,0));
y=y+z;
end