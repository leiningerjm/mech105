function [L,U,P] = luFactor(A)
%luFactor Determines the LU Factorization of an inputted square matrix, A,
%which must have the same number of rows and columns.
%Outputs a lower triangular matrix, L, an upper triangular matrix, U,  and
%the pivot matrix, P.
%   Inputs:
%       A - the square matrix being factorized
%   Outputs:
%       L - lower triangular matrix
%       U - upper triangular matrix
%       P - pivot matrix
%
%           Jon Leininger 3/21/18

%% Check Input
if nargin ~= 1 % Checks if there are too few or too many inputs
    error('Exactly one input needed, see help for help.');
end
if ismatrix(A) ~= 1 % Check if input is a matrix
    error('Input must be a matrix.');
end
if size(A,1) ~= size(A,2) % Checks if A is a square matrix
    error('Input matrix must be a square.');
end

%% Setup Variables
[n,n] = size(A); % Get size of square
L = eye(n); % Create L using identity matrix
U = A; % Create U by copying A
P = eye(n); % Create P using identity matrix
%% Perform Factorization

for i = 1:n
    [pivot, m] = max(abs(U(i:n,i))); % Find the index of the largest element
    m = m + i-1; % Adjust m since on searches where i > 1 it will not count the rows that have been previously transformed
    if m ~= i % Check if the largest value is already in the correct place
    U([m,i],:) =  U([i,m], :);   % Change rows m and i in U
    P([m,i],:) =  P([i,m], :);   % Change rows m and i in P
    if i >= 2    % Need to move the elements of L if the elements in U have moved
      L([m,i],1:i-1) =  L([i,m], 1:i-1);   % Change rows m and i in columns 1:i-1 of L
    end
  end
  for j = i+1:n      
    L(j, i) = U(j, i) / U(i, i); % Find ratio to multiply the row by and store it in L
    U(j, :) =  U(j, :) - L(j, i)*U(i, :); % Set the current row, j, to itself minus the row above it multiplied by the ratio
  end
end
disp(L); % Display matrices for testing purposes
disp(U);
disp(P);
end


