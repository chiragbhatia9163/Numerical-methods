function X=Gauss_Jordan(A,B) %A=[3,-13,9,3; -6,4,1,-18; 6,-2,2,4; 12,-8,6,10] B=[-19;-34;16;26]
format long
[m,~]=size(A);
[I,~] = max(abs(A),[],2);
I=(1./I);
for i=1:m
    C=A((i:m),i).*I((i:m),:);
    C=abs(C);
    [~,q]=max(C);
    if i~=(q+i-1)
    A([i (q+i-1)],:)=A([(q+i-1) i],:);
    I([i (q+i-1)],:)=I([(q+i-1) i],:);
    B([i (q+i-1)],:)=B([(q+i-1) i],:);
    end
    for j=1:m
        if j~=i
        d=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-(d*A(i,:));
        B(j)=B(j)-(d*B(i));
        end
    end
end
X=ones(m,1);
for i=1:m
    X(i)=B(i)/A(i,i);
end
end