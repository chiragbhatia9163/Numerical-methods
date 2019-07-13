function [b,ea,i] = Iterative_error_estimates(x,es,max_iteration)%e^x series  es=maximum error allowed ((1e-6)=(1*10^-6))
i=1;%number of iterations allowed                                % x->value at which ans is to be found
b=1;%answer till first term                                      % max_iteration -> 100
a=1;
while (a~=0)
prev = b;
b= b + x ^ i / factorial(i);
i = i + 1;
if b~=0
ea=abs((b - prev)/b)*100; % approximate estimate of error
end
if ea<=es || i==max_iteration
    a=0;
end
end
end