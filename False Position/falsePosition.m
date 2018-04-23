function [root,fx,ea,iter] = falsePosition(func, xl, xu, es, maxiter)
%The purpose of this function is to determine the root of any function 
%entered using the false position method
%
%INPUTS
%   func - Enter function you want root of (in format @(x) f(x))
%   xl - Lower guess of root
%   xu - Upper guess of root
%   es -  Desired relative error (default 0.0001%)
%   maxiter - Desired number of iteration (default 200)
%
%OUTPUTS
%   root - Estimated root of func
%   fx - the function evaluated at the root location
%   ea - Approximate relative error (%)
%   iter - Number of iterations performed

%-------------------Setting Defaults and Input Errors----------------------
if nargin < 3
    error('Not enough variables entered')
end

if nargin > 5
    error('Too many input variables')
end

if nargin  < 5
    maxiter = 200
end

if nargin < 4
    es = 0.0001
    maxiter = 200
end     

iter = 0
ea = 100
%-----------------End of Setting Defaults and Input Errors-----------------
tic
%This if statement contains when "es" and "maxiter" are empty
if isempty(es) == 1 && isempty(maxiter) == 1
        while ea > es || maxiter >= iter
            %root determines the estimated root of the function
        root = xu - ((func(xu)*(xl-xu))/ (func(xl)-func(xu)))
            %guessmid finds the mid point between each value
            guessmid = (xl+xu)/2
            %These if statments determine if there is a change in sign
            if func(xl)*func(guessmid) <0
                xl = xl
                xu = guessmid
            end
            
            if func(guessmid) * func(xu) < 0
                xl = guessmid
                xu = xu
            end
            %ea finds the approximate error
            ea = (abs(((xu - ((func(xu)*(xl-xu))/ ((func(xl)-func(xu))))-root)/xu - ((func(xu)*(xl-xu))/ (func(xl)-func(xu))))))*100
            iter = iter +1
        end
elseif isempty(es) == 0 || isempty(maxiter) == 1
        while ea > es || maxiter >= iter
        root = xu - ((func(xu)*(xl-xu))/ (func(xl)-func(xu)))
        
            guessmid = (xl+xu)/2
            
            if func(xl)*func(guessmid) <0
                xl = xl
                xu = guessmid
            end
            
            if func(guessmid) * func(xu) < 0
                xl = guessmid
                xu = xu
            end
            ea = (abs(((xu - ((func(xu)*(xl-xu))/ ((func(xl)-func(xu))))-root)/xu - ((func(xu)*(xl-xu))/ (func(xl)-func(xu))))))*100
            iter = iter +1
        end
end
toc
fx= func(root)
%--------------------------Print Answers-----------------------------------
fprintf('fx is %d \n', fx) 
fprintf('iter is %d \n', iter)
fprintf('ea is %d \n', ea)
fprintf('root is %d \n', root)
