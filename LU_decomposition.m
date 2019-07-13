function X=LU_decomposition(U,B)
format long
[m,~]=size(U);
[I,~] = max(abs(U),[],2);
I=(1./I);
L=eye(m);
for i=1:m-1
    C=U((i:m),i).*I((i:m),:);
    C=abs(C);
    [~,q]=max(C);
    if i~=(q+i-1)
        U([i (q+i-1)],:)=U([(q+i-1) i],:);
        I([i (q+i-1)],:)=I([(q+i-1) i],:);
        B([i (q+i-1)],:)=B([(q+i-1) i],:);
        if i~=1
            L([i (q+i-1)],i-1)=L([(q+i-1) i],i-1);
        end
    end
    for j=i+1:m
        p=U(j,i)/U(i,i);
        L(j,i)=p;
        U(j,:)=U(j,:)-(p*U(i,:));
        %B(j)=B(j)-(d*B(i));
    end
end
disp(L)
disp(U)
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