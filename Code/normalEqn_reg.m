function [theta] = normalEqn_reg(X, y, lambda)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------
n=size(theta);
temp=zeros(n,n);
for i=2:n
	temp(i,i)=1;
end
theta=pinv(X'*X+lambda.*temp)*X'*y;


% -------------------------------------------------------------


% ============================================================

end
