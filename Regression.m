function [a0,a1,r,s]=Regression(X,Y)
[m,~]=size(X);
for i=1:m
    if i==1
        xsum=X(i);
        ysum=Y(i);
        xysum=(X(i)*Y(i));
        x2sum=(X(i)*X(i));
    else
        xsum=xsum+X(i);
        ysum=ysum+Y(i);
        xysum=xysum+(X(i)*Y(i));
        x2sum=x2sum+(X(i)*X(i));
    end
end

xmean=xsum/m;
ymean=ysum/m;
a1=(m*xysum-xsum*ysum)/(m*x2sum-xsum*xsum);
a0=ymean-a1*xmean;

for i=1:m
    if i==1
        st=(Y(i)-ymean)^2;
        sr=(Y(i)-a1*X(i)-a0)^2;
    else
        st=st+(Y(i)-ymean)^2;
        sr=sr+(Y(i)-a1*X(i)-a0)^2; 
    end
end
s=(sr/(m-2))^0.5;
r=((st-sr)/st)^0.5;
plot(X, a1*X+a0);
end