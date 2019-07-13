function xr=False_position_method(f,xl, xu, es, max_iteration) %f=@(x) ((667.38*(1-exp(-0.146843*x)))/x)-40;
i=1;                                              % xl=14;% xu=16;% xl=12; % imax=100;% es=0.5;
fl=f(xl);
fu=f(xu);
a=1;
il=0;
iu=0;
while (a~=0)
    if i~=1
        xrold=xr;
    end
    xr=xu-fu*(xl-xu)/(fl-fu);
    fr=f(xr);
    if i~=1
        ea=abs((xr-xrold)/xr)*100
    end
    if fl*fr<0
        xu=xr;
        fu=fr;
        iu=0; % to make u count=0
        il=il+1; % increment l count
        if il>=2 
            fl=fl/2; % half the func value in case of stuck bound 
        end
    elseif fl*fr>0
        xl=xr;
        fl=fr;
        il=0; % to make l count=0
        iu=iu+1; % increment u count
        if iu>=2 
            fu=fu/2; % half the func in case of stuck bound
        end
    else
        ea=0;
    end
    if i~=1 && (ea<=es || i==max_iteration)
        a=0;
    end
    i=i+1;
end
end