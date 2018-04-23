# False Position

### Basic Description

##### The False Position function locates a root of a function by joining f(x) and f(x1) by a straight line. Provided that f(x) is negative and f(x1) is positive.

### Inputs

##### func - Enter function the user wants an estimate of the root.
##### xl - Enter a lower estimate of the root, it must be f(xl) must be negative
##### xu - Enter an upper estimate of the root, it must be f(xu) must be positive
##### es - This is the desired relative error for the ouput. If none is entered it defaults to (0.0001%)
##### maxiter - This is the desired number of interations before an output is given. If none is entered it defaults to 200 iterations.

### Outputs

##### root - This is the estimated root of the funciton found after the number of iterations.
##### fx - This is the function evaluated at the root location.
##### ea - This is the approximate relative error after the number of iterations are performed.
##### iter - This is the final number of iterations performed after getting to either maxiter or desired relative error.  

### Limitations

##### The major limitation to this function is that it only gives an estimate of the root.

### Other Information

##### Currently this function doesn't work with more complicated function inputs. It works with less complicated inputs but there is some error within the code that struggles with overly complicated functions. 
