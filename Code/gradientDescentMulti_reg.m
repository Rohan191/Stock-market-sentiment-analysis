function [theta, J_history] = gradientDescentMulti_reg(X, y, theta, alpha, num_iters, lambda)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
n=size(X,2);
temp=zeros(m,n);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
	
		%temp1=(X*theta-y).*X(:,1);
		%temp2=(X*theta-y).*X(:,2);
		%temp3=(X*theta-y).*X(:,3);
		%theta(1)=theta(1)-(alpha/m)*sum(temp1);
		%theta(2)=theta(2)-(alpha/m)*sum(temp2);
		%theta(3)=theta(3)-(alpha/m)*sum(temp3);
	for i=1:n
		temp(:,i)=(X*theta-y).*X(:,i);
		
	end
	for i=1:n
		if(i==1)
			theta(i)=theta(i)-(alpha/m)*sum(temp(:,i));
		else
			theta(i)=theta(i)*(1-alpha*lambda/m)-(alpha/m)*sum(temp(:,i));
	end




%fprintf('%f \n', theta);
    % ============================================================

    % Save the cost J in every iteration    
    %J_history(iter) = computeCostMulti_reg(X, y, theta,lambda);
	%fprintf('%f \n', J_history(iter));
end

end
