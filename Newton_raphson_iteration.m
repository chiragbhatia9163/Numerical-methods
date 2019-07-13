function xr=Newton_raphson_iteration(f,x0,es,max_iteration)  % syms x; f=exp(-x)-x; x0=0; es=1e-8; max_iteration=6;
format long;
i=0;
xr=x0;
a=1;
g=matlabFunction(diff(f));
f=matlabFunction(f);
while a~=0
    prev=xr;
    xr=xr-(f(xr)/g(xr));
    if xr~=0
        ea=abs((xr-prev)/xr)*100
    end
    if ea<es || i==max_iteration
        a=0;
    end
end
a=f(xr);
fprintf('Difference in ans is ');
disp(a)
end