# luFactor README
luFactor is a function that determines the LU Factorization of an inputted square matrix, A,
which must have the same number of rows and columns.
Outputs a lower triangular matrix, L, an upper triangular matrix, U,  and
the pivot matrix, P.
# Inputs
* A - the square matrix being factorized
# Outputs
* L - lower triangular matrix
* U - upper triangular matrix
* P - pivot matrix
# Limitations
The input matrix, A, **MUST** be a square matrix (same number of rows and columns).
# Example Usage
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
