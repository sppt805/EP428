function x = NewtonRaphsonMultivar_v2(f,x0,target)

error = target+1;
%fi = zeros(length(x0));
i = 0;

while error > target
   df = Jacobian(f,x0,error);
   
   fi = f(x0);
   
   dx = linsolve(df,fi);
   
   x = x0 - dx;
   x0 = x;
   error = max(abs(dx));
   i=i+1;
end

end