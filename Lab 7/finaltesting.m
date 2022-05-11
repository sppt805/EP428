x0 = [0.5;0.5];

x = NewtonRaphsonMultivar(@finaleq,x0,1E-4);
f = finaleq(x);