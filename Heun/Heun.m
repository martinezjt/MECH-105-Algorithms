function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
% The purpose of this function is to determine the derivative of a
% function using the Heun method with multiple iterations. It will give a more
% accurate estimate than Euler's method.
%
%INPUTS
%
%   dydt - This is the differential equation (Enter in @(t,y) format)
%   tspan - This is the span the user wants to solve for within the
%   equation
%   y0 - This is the initial condition
%   h - This is the step size
%   es - This is the error (if not entered default to 0.001)
%   maxit - This is the max number of iterations (if not entered default to
%   50 iterations)
%
%OUTPUTS
%
%   t - This is the t value
%   y - This is the final derivative estimate of point t

% ----------------- Setting Defaults and Input Errors--------------------%

if nargin < 4 
    error('Not Enough Inputs')
end

if nargin == 4
    es = 0.001
    maxit = 50
end

if nargin == 5
    maxit = 50
end

iter = 0
ea = 100
% ----------------- End Setting Defaults and Input Errors----------------%

while ea > es || iter < maxit
    initial = y0 + h * dydt(t,y)
    corrector = y0 + (h/2) * ( y0 + initial)
    ea = (abs(corrector - initial/ corrector)*100)
    iter = iter +1
    y = corrector %This has to be inserted into a y matrix HOW??
end
disp(y) %Must be in matrix
disp(t) %Must be in matrix


y0 = tspan + h %This has to add h to the first tspan number HOW??
%Still has to repeat for each iteration

%Still needs to address if h doesn't go evenly into tspan and to do another
%iteration.



    
    
    
    
    
    
    
    
    
    
    