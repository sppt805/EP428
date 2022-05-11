%final eq
function f=finaleq(r0)

f1 = r0(1)^2 + r0(2)^2 -1;
f2 = r0(2)-exp(-r0(1)^2);

f = [f1;f2];
end