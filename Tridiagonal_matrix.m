function X=Tridiagonal_matrix(A,B,C,R)
[m,~]=size(B);
for i=2:m
    A(i)=A(i)/B(i-1);
    B(i)=B(i)-(A(i)*C(i-1));
end
disp(A)
disp(B)
for i=2:m
    R(i)=R(i)-(A(i)*R(i-1));
end
disp(R)
X=zeros(m,1);
X(m)=R(m)/B(m);
for i=m-1:-1:1
    X(i)=(R(i)-(C(i)*X(i+1)))/B(i);
end
end