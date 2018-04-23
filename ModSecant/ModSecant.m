function [ea, root] = ModSecant (func, x1, d)
%The purpose of this function is to determine the root of a funtion using
%the Modified Secant Method.
%
%INPUTS
%   func - Function you want to find root of (@(x) f(x))
%   x1 - The first estimate of the root
%   d - delta or change in x for each iteration
%
%OUTPUT
%   ea - the approximate error
%   root - final root estimate
 
if nargin < 2 
    error('Not enough inputs')
end

if nargin > 3
    error ('Too many inputs')
end
et = 0.001
ea = 100
while ea > et
    root = x1 * (((d*x1)*func(x1))/ (func(x1 + (d*x1))-func(x1)))
    
    ea = (abs( root- x1/root))*100
    
    x1 = root
end

