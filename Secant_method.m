function xr=Secant_method(f,x0,x1,es,max_iteration) %f=@(x) exp(-x)-x; es=1e-8; max_iteration=20; x0=0; x1=1;
format long;
i=0;
xr=x0;
a=1;
d=f(x0);
c=f(x1);
while a~=0
    prev=xr;
    xr=x1-(c*(x0-x1))/(d-c)
    if xr~=0
        ea=abs((xr-prev)/xr)*100
    end
    if ea<es || i==max_iteration
        a=0;
    end
    x0=x1;
    x1=xr;
    d=c;
    c=f(xr);
    i=i+1;
end
a=f(xr);
fprintf('Difference in ans is ');
disp(a*100)
end