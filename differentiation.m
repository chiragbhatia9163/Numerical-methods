function differentiation(f,x,n) % x->value at which derivative is to be found
format long %for higher precision                         % n-> number of times step size is to be reduced by 10
derivative=matlabFunction(diff(f));
derivative=derivative(x);                                  %input -> (f,x=0.5,n=11), syms x; f=-0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2;
f=matlabFunction(f);
h=1; %step size                                           
H=zeros(n,1); %pre-initializing with zeroes for faster speed  
D=zeros(n,1);
E=zeros(n,1);
for i=1:n
H(i,1)=h;
D(i,1)=(f(x+h)-f(x-h))/(2*h);
E(i,1)=abs(derivative-D(i,1));
h=h/10;    % lesser the step size more precise the ans
end
L=[H,D,E];
disp(['       step size       finite difference       true error']);
disp(L);
%graph between step size and error
loglog(H,E),xlabel('Step Size'),ylabel('Error')
title('Plot of Error Versus Step Size')