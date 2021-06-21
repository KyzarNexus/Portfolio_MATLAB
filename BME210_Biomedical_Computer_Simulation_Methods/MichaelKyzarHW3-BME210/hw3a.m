function [L,U] = hw3a(A)
[dRow,dCol] = size(A);
% Assuming we're working with a square matrix
if dRow ~= dCol
    error('Matrix inputted is not a square matrix');
else
    N=dRow;
    L = zeros(N); U = zeros(N);
    % Step 1
    for i = 1:N
        L(i,i) = 1;
    end
    % Step 2
    for j = 1:N
        for i = 1:j
        U(i,j)=A(i,j)-dot(L(i,1:(i-1)),U(1:(i-1),j));
        end
        for i = (j+1):N
        L(i,j)=(1/U(j,j))*(A(i,j)-dot(L(i,1:(j-1)),U(1:(j-1),j)));
        end
    end
end 
end