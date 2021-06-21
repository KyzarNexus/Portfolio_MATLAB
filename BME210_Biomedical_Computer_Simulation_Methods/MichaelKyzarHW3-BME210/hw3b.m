function [x,y] = hw3b(L, U, B)

% Initializing Variables
n = length(B);
y = n;
x = n;

% Forward Substitution
y(1) = B(1)/L(1,1);
for i = 2:n
    y(i) = (1/L(i,i))*(B(i) - dot(L(i,1:(i-1)),y(1:(i-1))));
end

% Backwards Substitution
x(n) = y(n)/U(n,n);
for i = n-1:-1:1
    x(i) = (1/U(i,i))*(y(i)-dot(U(i,(i+1:n)),x((i+1:n))));
end

end