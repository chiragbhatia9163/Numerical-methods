function X=Crouts_decomposition(A,B)
[m,~]=size(A);
for j=2:m
    A(1,j)=A(1,j)/A(1,1);
end
for j=2:m-1
    for i=j:m
        sum=0;
        for k=1:j-1
            sum=sum+(A(i,k)*A(k,j));
        end
        A(i,j)=A(i,j)-sum;
    end
    for k=j+1:m
        sum=0;
        for i=1:j-1
            sum=sum+(A(j,i)*A(i,k));
        end
        A(j,k)=(A(j,k)-sum)/A(j,j);
    end
end
sum=0;
for k=1:m-1
    sum=sum+(A(m,k)*A(k,m));
end
A(m,m)=A(m,m)-sum;
U=eye(m)+triu(A,1)
L=tril(A)
D=ones(m,1);
D(1)=B(1)/L(1,1);
for i=2:m
    sum=B(i);
    for j=1:i-1
        sum=sum-(L(i,j)*D(j));
    end
    D(i)=sum/L(i,i);
end
disp(D)
X=ones(m,1);
X(m)=D(m);
for i=m-1:-1:1
    sum=D(i);
    for j=i+1:m
        sum=sum-(U(i,j)*X(j));
    end
    X(i)=sum/U(i,i);
end
end