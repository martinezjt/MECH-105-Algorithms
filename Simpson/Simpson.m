function I = Simpson(x,y)
% The purpose of this function is to determine the integral of a
% function through the use of Simpson's rule, and if required the
% trapezoidal rule.
%
%INPUTS
%
%   x - Input first matrix of data you want to find the integral of
%   y - Input second matrix of data you want to find the integral of
%
%OUTPUTS
%
%   I -This is the output of the integration of x and y. Will only be an
%   estimate.

% ---------------------------Setting Defaults-----------------------------

if length(x) ~= length(y) %Ensures both matrices equal each other
    error('Matrices must have equal number of elements')
end

if nargin > 2 %Ensures the number of inputs is correct
    error('Too many inputs')
end

if nargin < 2
    error('Not enough inputs')
end
 

%---------------------------End of Setting Defaults-----------------------

a = x(1) %Sets the "a" variable of this equation
n = 2 % Sets the spacing of the areas (2 because the 1/3 rule)
h = 2 %Sets the "h" variable of this equation (Height of the areas)
s4 = 0 %This starts the process for 4 * f(xi)
s2 = 0 %This starts the process for 2 * f(xj)

%This uses only the Simpsons 1/3 rule to integrate. (No trapezoidal rule
%needed at the end of the use of the Simpson rule)
    for i = 2: 2: n %This uses the even numbered elements of matrix x at the second element
        s4 = s2 + 2*y(i) %new answer is 4 times the element i of matrix x
    end
    
    for i = 3:2: n-1 %This uses the odd numbered elements of matrix x at the third element
        s2 = s2 + 2*y(i) % new answer is 2 times element i of maxtrix y
    end
    
    %Trapezoidal Rule for Final Left Over Segment
disp('warning the trapezoidal rule must be used for better accuracy in final segment')
a1 = y(n-1) %finds the base 1 of the trapezoid
b1 = y(n) %finds the base 2 of the trapezoid
h1 = x(n-1,1) - x(n,1) %Finds the height
area = abs(((a1+b1)*h1)/2) %Equation for finding the area of a trapezoud
    
    integral = (h/3) * (y(1) + s4 +s2 + y(n)) %Determines integral of x and y
    
    finintegral = area + integral %Adds the trapezoid to the integral
    
    fprintf('The Integral is %d \n', integral) %Prints Integral in clear description
    
    I = finintegral %This fulfills the output required at the start of the code (More clearly defines)
end

