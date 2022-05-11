% Question 1
% This function calcuates the Jacobian Matrix for a given function f
function df = Jacobian(f,x,perturb)

fu = f(x);
df = zeros(length(fu),length(x));

for i=1:length(x)
   xp = x;
   xp(i) = x(i)+perturb;
   
   fp = f(xp);
   df(:,i) = (fp-fu)/perturb;
end

end