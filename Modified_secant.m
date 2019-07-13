function xr=Modified_secant(f,x0,p,es,max_iteration) %f=@(x) exp(-x)-x; es=1e-8; max_iteration=20; x0=1; p=0.01;
format long;
i=0;
xr=x0;
a=1;
while a~=0
    prev=xr;
    d=f(x0);
    c=f(x0+(p*x0));
    xr=x0-(p*x0*d)/(c-d)
    if xr~=0
        ea=abs((xr-prev)/xr)*100
    end
    if ea<es || i==max_iteration
        a=0;
    end
    x0=xr;
    i=i+1;
end
a=f(xr);
fprintf('Difference in ans is ');
disp(a*100)
end