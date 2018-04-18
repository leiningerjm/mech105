function [I] = Simpson(x,y)
%Simpson Performs Simpson's 1/3 Rule on a given set of x and y values. X
%and y inputs must be the same length and the x input must be equally
%spaced. If there are an odd number of intervals, the trapezoidal rule will
%be used on the last interval.
%   Inputs:
%       x - Vector of x values, must be equally spaced and must have the
%       same vector length as y.
%       y - Vector of y values, must be same length as x.
%   Outputs:
%       I - The numerically evaluated integral of function values 'y' with
%       respect to 'x.'
%
%               Jon Leininger
%                  4/8/18

%% Check inputs
if nargin ~= 2 % Check if there are 2 inputs
    error('Requires exactly 2 inputs, see help for more info.');
end
if (isvector(x) ~= 1) || (isvector(y) ~= 1) % Make sure the inputs are vectors
    error('Inputs must be vectors, see help for more info.');
end
if length(x) ~= length(y) % Check to see if inputs are the same length
    error('Inputs must be same length, see help for more info.');
end
if range(abs(diff(x))) > 1e4*eps(min(abs(x))) % Check to see if x inputs are equally spaced, they are considered equal if the diff returns a number near the machine epsilon
    error('X inputs are not equally spaced, see help for more info.');
end
if mod(length(x),2) == 0 % If there are an even number of points (odd interval) then give the user a warning
    odd = 1;
    warning('Odd number of intervals detected. Trapezoidal rule will be performed on last interval.');
else 
    odd = 0;
end

%% Perform evaluation
if odd == 1 % Performs Simpson's Rule with Trapezoidal rule
    a = x(1);
    b = x(length(x)-1);
    ta = x(length(x)-1);
    tb = x(length(x));
    x0 = 1;                 % Setup variables in terms of their y index
    x1 = length(x)/2;
    x2 = (length(x)-1);
    t1 = (length(x));
    
    I = (b-a)*((y(x0)+4*(y(x1))+y(x2))/6);
    I = I + ((tb-ta)*((y(x2)+y(t1))/2));    % Final result
else % Performs Simspon's Rule without Trapezoidal rule
    a = x(1);
    b = x(length(x));
    x0 = 1;
    x1 = ((length(x)+1)/2);     % Setup variables in terms of their y index
    x2 = length(x);
    
    I = (b-a)*((y(x0)+4*(y(x1))+y(x2))/6);  % Final result
end



end

