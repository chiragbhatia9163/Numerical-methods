function xr=Fixed_point_iteration(f,g,x0,es,max_iteration) %f=exp(-x)-x , g=exp(-x) , es=1.2 , max_iteration=20
format long;
i=0;
xr=x0;
a=1;
while a~=0
    prev=xr;
    xr=g(xr);
    if xr~=0
        ea=abs((xr-prev)/xr)*100
    end
    if ea<es || i==max_iteration
        a=0;
    end
end
a=f(xr);
fprintf('Difference in ans is ');
disp(a*100)
end