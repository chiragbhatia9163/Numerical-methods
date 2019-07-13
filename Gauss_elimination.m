function X=Gauss_elimination(A,B) %A=[3,-13,9,3; -6,4,1,-18; 6,-2,2,4; 12,-8,6,10] B=[-19;-34;16;26]
format long
[m,~]=size(A);
[I,~] = max(abs(A),[],2);
I=(1./I);
for i=1:m-1
    C=A((i:m),i).*I((i:m),:);
    C=abs(C);
    [~,q]=max(C);
    if i~=(q+i-1)
    A([i (q+i-1)],:)=A([(q+i-1) i],:);
    I([i (q+i-1)],:)=I([(q+i-1) i],:);
    B([i (q+i-1)],:)=B([(q+i-1) i],:);
    end
    for j=i+1:m
        d=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-(d*A(i,:));
        B(j)=B(j)-(d*B(i));
    end
end
disp(A)
X=ones(m,1);
X(m)=B(m)/A(m,m);
for i=m-1:-1:1
    sum=B(i);
    for j=i+1:m
        sum=sum-(A(i,j)*X(j));
    end
    X(i)=sum/A(i,i);
end
end