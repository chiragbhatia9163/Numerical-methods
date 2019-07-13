function [x,y,z]=Gauss_seidel(A,B,C,x0,y0,z0,es,max_iteration)                                                                   %g=@(x,y)((57-y)/(3*x))^(1/2);
i=0;                                                                            %Fixed_point_iteration_nonlinear_system(f,g,1.5,3.5,1e-20,10000)
a=1;
x=x0;
y=y0;
z=z0;
while a~=0
    prev1=x;
    prev2=y;
    prev3=z;
    x=A(x,y,z)
    if x~=0
        ea1=abs((x-prev1)/x)*100
    end
    y=B(x,y,z)
    if y~=0
        ea2=abs((y-prev2)/y)*100
    end
    z=C(x,y,z)
    if z~=0
        ea3=abs((z-prev3)/z)*100
    end
    if (ea1<=es && ea2<=es && ea3<=es) || i==max_iteration
        a=0;
    end
    i=i+1;
end
end