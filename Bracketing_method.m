function xr=Bracketing_method(f,xl, xu, es, max_iteration) %f=@(x) ((667.38*(1-exp(-0.146843*x)))/x)-40;
i=1;                                              % xl=14;% xu=16;% xl=12; % imax=100;% es=0.5;
fl=f(xl);
a=1;
while (a~=0)
    if i~=1
        xrold=xr;
    end
    xr=(xl+xu)/2;
    fr=f(xr);
    if i~=1
        ea=abs((xr-xrold)/xr)*100
    end
    if fl*fr<0
        xu=xr;
    elseif fl*fr>0
        xl=xr;
        fl=fr; % to reduce the number of computations
    else
        ea=0;
    end
    if i~=1 && (ea<=es || i==max_iteration)
        a=0;
    end
    i=i+1;
end
end