function X=Cholesky_decomposition(A,B)
[m,~]=size(A);
for k=1:m
    for i=1:k-1
        sum=0;
        for j=1:i-1
            sum=sum+(A(i,j)*A(k,j));
        end
        A(k,i)=(A(k,i)-sum)/A(i,i);
        A(i,k)=A(k,i);
    end
    sum=0;
    for j=1:k-1
        sum=sum+((A(k,j))^2);
    end
    A(k,k)=sqrt(A(k,k)-sum);
end
L=tril(A);
U=triu(A);
D=ones(m,1);
D(1)=B(1);
for i=2:m
    sum=B(i);
    for j=1:i-1
        sum=sum-(L(i,j)*D(j));
    end
    D(i)=sum/L(i,i);
end
disp(D)
X=ones(m,1);
X(m)=D(m)/U(m,m);
for i=m-1:-1:1
    sum=D(i);
    for j=i+1:m
        sum=sum-(U(i,j)*X(j));
    end
    X(i)=sum/U(i,i);
end
end