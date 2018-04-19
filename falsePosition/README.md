# falsePosition README
falsePosition is a function that returns the estimated root location, value of the function
at that location, approximate relative error, and how many iterations were
performed for a given function, lower guess, upper guess, desired relative
error, and max number of iterations.
# Inputs
* func - the function being evaluated
* xl - the lower guess
* xu - the upper guess
* es - the desired relative error (defaults to 0.0001%)
* maxiter - the number of iterations desired (defaults to 200)
# Outputs
* root - the estimated root location
* fx - the function evalutaed at the root location
* ea - the approximate relative error
* iter how many iterations were performed
# Defaults and Limitations
* It is **HIGHLY** recommended to use a symbolic function as your function input, see example below
* The desired relative error will default to 0.0001%
* The max iterations will defualt to 200
* The user's lower and upper guess must bracket the root
# Example Usage
### Input
```
f = @(x) (6+(4*3.59)/(x^2))*(x-2*.0427)-(2*.08205*323.15);
falsePosition(f,8,9)
```
### Output
```
Estimated root:
8.649585
Function evaluated at root:
-7.923411e-09
Approximate Relative Error:
0.000013
Iterations Performed:
3
```
