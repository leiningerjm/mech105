# numericalMethod-Algorithms
False Position, LU Factorization, and Simpson's Rule
# Purpose
This repository contains numerical method algorithms that were created for a mechanical engineering course at CSU.
# Contains
## falsePosition
A function that uses the false position method to return the estimated root location, value of the function
at that location, approximate relative error, and how many iterations were
performed for a given function, lower guess, upper guess, desired relative
error, and max number of iterations.
### Example Usage
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
## luFactor
luFactor is a function that determines the LU Factorization of an inputted square matrix, A,
which must have the same number of rows and columns.
Outputs a lower triangular matrix, L, an upper triangular matrix, U,  and
the pivot matrix, P.
### Example Usage
### Input
```
matrix = [10 2 -1;-3 -6 2;1 1 5]
luFactor(matrix)
```
### Output

#### L

```
1.0000         0         0
   -0.3000    1.0000         0
    0.1000   -0.1481    1.0000
```
#### U
```
   10.0000    2.0000   -1.0000
         0   -5.4000    1.7000
         0         0    5.3519
```
#### P
```
     1     0     0
     0     1     0
     0     0     1
```
## Simpson
This function performs Simpson's 1/3 Rule on a given set of x and y values. X
and y vectors must be the same length and the x input must be equally
spaced. If there are an odd number of intervals, the trapezoidal rule will
be used on the last interval.
### Example Usage
### Input
```
v1 = [140 141 142 143 144 145 146 147 148 149];
v2 = [15.72 15.53 15.19 16.56 16.21 17.39 17.36 17.42 17.60 17.75];
Simpson(v1,v2);
```
### Output
```
ans =

  148.5550
```
