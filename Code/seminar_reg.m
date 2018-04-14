%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = csvread('abc.csv');
X = data(:, 2:534);
y = data(:, 535);
m = length(y);

% Print out some data points
%fprintf('First 10 examples from the dataset: \n');
%fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
%fprintf('Normalizing Features ...\n');

%[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 8000;

% Init Theta and Run Gradient Descent 
theta = zeros(534, 1);
lambda=1;
%[theta, J_history] = gradientDescentMulti_reg(X, y, theta, alpha, num_iters, lambda);
%printf('J is %f',J_history(num_iters) );
% Plot the convergence graph
%figure;
%plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
%xlabel('Number of iterations');
%ylabel('Cost J');

% Display gradient descent's result
%fprintf('Theta computed from gradient descent: \n');
%fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
%price = 0; % You should change this
%area=(1650-mu(1,1))/sigma(1,1);
%br=(3-mu(1,1))/sigma(1,1);
%price=[1,area,br]*theta;
% ============================================================

%fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
%         '(using gradient descent):\n $%f\n'], price);

%fprintf('Program paused. Press enter to continue.\n');
%pause;

%% ================ Part 3: Normal Equations ================

%fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data = csvread('abc.csv');
X = data(:, 2:534);
y = data(:, 535);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn_reg(X, y, lambda);
temp=csvread('tfv.csv');
ip=temp(:,2:534);
n=size(ip,1)
ip=[ones(n,1) ip];
op=ones(n,1);
for i=1:n
	x=ip(i,:)*theta;
	%op(i,1)=ip(i,:)*theta;
	
	if(x>0.2)
		op(i,1)=1;
	end
	if(x<-0.2)
		op(i,1)=-1;
	end
	if(x>=-0.2 && x<=0.2)
		op(i,1)=0;
	end
	
end
%fprintf(' %f \n', op);
csvwrite("op.csv", op);
% Display normal equation's result
%fprintf('Theta computed from the normal equations: \n');
%fprintf(' %f \n', theta);
%fprintf('\n');

%csvwrite ("data.csv", theta);

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
%price = 0; % You should change this
%price=[1,1650,3]*theta;

% ============================================================

%fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
%        '(using normal equations):\n $%f\n'], price);

