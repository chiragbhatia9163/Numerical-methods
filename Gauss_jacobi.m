function [x,y,z]=Gauss_jacobi(A,B,C,x0,y0,z0,es,max_iteration)                                                                   %g=@(x,y)((57-y)/(3*x))^(1/2);
i=0;                                                                            %Fixed_point_iteration_nonlinear_system(f,g,1.5,3.5,1e-20,10000)
a=1;
x=x0;
y=y0;
z=z0;
while a~=0
    prev1=x;
    prev2=y;
    prev3=z;
    xx=A(x,y,z)
    if xx~=0
        ea1=abs((xx-prev1)/xx)*100
    end
    yy=B(x,y,z)
    if yy~=0
        ea2=abs((yy-prev2)/yy)*100
    end
    zz=C(x,y,z)
    if zz~=0
        ea3=abs((zz-prev3)/zz)*100
    end
    x=xx;
    y=yy;
    z=zz;
    if (ea1<=es && ea2<=es && ea3<=es) || i==max_iteration
        a=0;
    end
    i=i+1;
end
end