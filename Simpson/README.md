# Simpson README
This function performs Simpson's 1/3 Rule on a given set of x and y values. X
and y vectors must be the same length and the x input must be equally
spaced. If there are an odd number of intervals, the trapezoidal rule will
be used on the last interval.
# Inputs
* x - Vector of x values, must be equally spaced and must have the
same vector length as y.
* y - Vector of y values, must be same length as x.
# Outputs
* I - The numerically evaluated integral of function values 'y' with
respect to 'x.'
# Limitations
* The inputs must be vectors
* The vectors must have the same length
* The values in the 'x' vector must be equally spaced
* If there are an even number of points (odd intervals) the function will perform the trapezoidal rule on the last interval and,
additionally, it will give the user a warning message
# Example Usage
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
