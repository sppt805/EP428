function f = TestingEq(x0)

f1 = exp(-exp(x0(1)+x0(2))) - x0(2)*(1+x0(1)^2);
f2 = x0(1)*cos(x0(2)) + x0(2)*sin(x0(1))+1/2;

f = [f1;f2];
end