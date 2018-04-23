function [L,U,P] = luFactor(A)
%The purpose of this function is to determine the the LU Factorization
%of a square matrix. Partial Pivoting will be used when determining L and
%U. The pivoting will be kept track of within the "P" matrix.
%
%INPUT
%
%   A - A sqaure matrix of any size that you want to determine the LU
%       Factorization of. The number of rows has to equal the number of
%       columns
%OUTPUT
%
%   L - The lower triangular matrix
%   U - The upper triangular matrix
%   P - The pivot matrix

%-------------------------Setting Defaults-------------------------------

if nargin > 1
    error('Too many inputs') %This ensures on the A matrix is entered
end

[n,m] = size(A)

if n ~= m
    error('Not Square Matrix') %This ensures that the user enters a square matrix
end


%-------------------------End Setting Defaults----------------------------
 
[n, n1] = size(A); L=eye(n); P=eye(n); U=A;
for j = 1:n
  [pivot m] = max(abs(U(j:n, j)));    %Decide if pivot necessary or not
  m = m+j-1;
  if m ~= j
    U([m,j],:) =  U([j,m], :);   % interchange rows m and j in U
    P([m,j],:) =  P([j,m], :);   % interchange rows m and j in P
    if j >= 2;                   % This checks to ensure more pivoting isnt required
      L([m,j],1:j-1) =  L([j,m], 1:j-1);   % interchange rows m and j in columns 1:j-1 of L
    end
  end
  for i = j+1:n                             %This solves for the L and U matrix
    L(i, j) = U(i, j) / U(j, j);            
    U(i, :) =  U(i, :) - L(i, j)*U(j, :);
  end
end
disp('L is') %displaying matrix L
disp(L)
disp('U is') %displaying matrix U
disp(U)
disp('P is') %displaying matrix P
disp(P)
 
check_PxA =P*A    %This checks to make sure the pivoting was correct
matlabluA = lu(A) % This is the matlab solution using the built in function
check_LxU = L*U   % This ensures that L*U does equal A

