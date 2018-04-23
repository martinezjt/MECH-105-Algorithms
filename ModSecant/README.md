# Modified Secant Method

### Basic Description

##### The Modified Secant function locates a root of a function by using the difference between the two points used. It is more accurate than the false position method.

### Inputs

##### func - This input is the function you want to find the root of.
##### x1 - This is the first estimate of the root that is created as an input.
##### d - This is the given change in x for each iteration of the Modified Secant Method.

### Outputs

##### ea - This is the approximate error found after each iteration. This is used as a stopping criteria for the loop for a 0.001% error.
##### root - This is the final root estimate after reaching an error of 0.0001%.

### Limitations

##### The major limitation of this function is that the only option for stopping criteria is stuck at 0.0001%. This should be changed as an input so that the user can decide when the user wants to loops to stop.

### Other Information

##### This function was not given as an assignment during class. It was just used for a homework assignment and I found it was easier to just write this code rather than do the math by hand. 

