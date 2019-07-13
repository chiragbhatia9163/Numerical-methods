function [xx,yy]=Newton_raphson_nonlinear_system(f,g,x0,y0,es,max_iteration) %f=@(x,y)(10-(x*y))^(1/2);
format long;                                                                   %g=@(x,y)((57-y)/(3*x))^(1/2);
i=0;                                                                            %Fixed_point_iteration_nonlinear_system(f,g,1.5,3.5,1e-20,10000)
a=1;
xx=x0;
yy=y0;
syms x y;
p=matlabFunction(diff(f,x),'vars', [x y]);
q=matlabFunction(diff(f,y),'vars', [x y]);
r=matlabFunction(diff(g,x),'vars', [x y]);
s=matlabFunction(diff(g,y),'vars', [x y]);
f=matlabFunction(f);
g=matlabFunction(g);
while a~=0
    prev1=xx;
    prev2=yy;
    xx=xx-(((f(xx,yy)*s(xx,yy))-(g(xx,yy)*q(xx,yy)))/((p(xx,yy)*s(xx,yy))-(q(xx,yy)*r(xx,yy))))
    if xx~=0
        ea1=abs((xx-prev1)/xx)*100
    end
    yy=yy-(((g(xx,yy)*p(xx,yy))-(f(xx,yy)*r(xx,yy)))/((p(xx,yy)*s(xx,yy))-(q(xx,yy)*r(xx,yy))))
    if yy~=0
        ea2=abs((yy-prev2)/yy)*100
    end
    if (ea1<=es && ea2<=es) || i==max_iteration
        a=0;
    end
    i=i+1;
end