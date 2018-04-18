function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falsePosition Returns the estimated root location, value of the function
%at that location, approximate relative error, and how many iterations were
%performed for a given function, lower guess, upper guess, desired relative
%error, and max number of iterations.
%   Inputs:
%       func - the function being evaluated
%       xl - the lower guess
%       xu - the upper guess
%       es - the desired relative error (defaults to 0.0001%)
%       maxiter - the number of iterations desired (defaults to 200)
%   Outputs:
%       root - the estimated root location
%       fx - the function evalutaed at the root location
%       ea - the approximate relative error
%       iter how many iterations were performed
%
%           Jon Leininger 2/16/18


%% Check Inputs
if nargin < 3 || nargin > 5 % Check if the user enters at least 3 inputs, or more than 5.
    error('Please specify at least 3 inputs, but no more than 5. See help for more info.');
end
test = func(xl) * func(xu); % Check if the user brackets the root.
if test > 0 
    error('There is no root between the upper and lower guess.');
end
if nargin < 4 || isempty(es) % Default stopping criterion
    es = 0.0001;
end
if nargin < 5 || isempty(maxiter) % Default max iterations
    maxiter = 200;
end

%% Set up variables
iter = 0; % Set iterations to zero.
xr = xl; % Set present guess
ea = 100; % Default approx error to 100

%% Perform algorithm
while (1)
   iter = iter + 1; % Iteration counter
   xrold = xr; % Set previous guess
   xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu)); % False Position method to determine root guess.
   if xr ~= 0
       ea = abs((xr-xrold)/xr)*100; % Determine approx relative error
   end
   test2 = func(xl) * func(xr); % Check if root is between the present guess and upper or lower guess.
   if test2 < 0
       xu = xr;
   elseif test2 > 0
       xl = xr;
   else
       ea = 0; % Check if we have found the root exactly.
   end
   if ea <= es || iter >= maxiter % Break out of the loop if we have met the stopping criterion or are about to exceed max iterations.
       break;
   end
end

%% Assign outputs
root = xr;
fx = func(xr);

%% Print outputs
words = 'Estimated root:\n';
words2 = 'Function evaluated at root:\n';
words3 = 'Approximate Relative Error:\n';
words4 = 'Iterations Performed:\n';
fprintf(words);
fprintf('%f\n', root);
fprintf(words2);
fprintf('%e\n', fx);
fprintf(words3);
fprintf('%f\n', ea);
fprintf(words4);
fprintf('%d\n', iter);


end

