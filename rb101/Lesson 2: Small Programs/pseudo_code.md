pseudo_code.md
---
Write out pseudo-code (both casual and formal) that does the following:
1. a method that returns the sum of two integers
2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
3. a method that takes an array of integers, and returns a new array with every other element
---
## 1) Method that Returns the Sum of Two Integers

Pseudo-code:

First, ask user to input any two integer values.  
Then, create a method that adds the two integer values and returns the sum.  
Finally, print out some message indicating that the sum of the two values is equal to the result given by the method.


Formal pseudo-code:

`START` by asking the user to input an integer value.  
`GET` the input from user and `SET` it by giving it a variable name.  
`DEFINE` a method that READs the two variable values, and adds them together.  
`PRINT` the result to the screen.  
`END`

---
## 2) Method that takes an Array of Strings and Returns a Concatenated String

Pseudo-code:

Take a given array of separate strings.  
Extract the separate strings and concatenate them together to form a single string composed of each separate string of the original array.  
Return the single string and print it to the screen.  

Formal pseudo-code:

`START` with a method definition whose argument is an array and which will:  
`GET` an array inputted by the user.  
`READ` the array input by the user, and collect each element of the array.  
`SET` the collected elements as a single string separated by a space by assigning them to a single variable.  
`PRINT` the value of the assigned variable.  
`END`  

---
## 3) Method that takes an Array of Integers and Returns a New Array with Every Other Element

Pseudo-code:

Define a method that takes an array of integers.  
Then, select only those elements of the array whose index is even, thus skipping every other element.  
Finally, return those elements in a new array object.  

Formal pseudo-code:

`START` with a method definition that takes an array as an argument.  
`READ` the array, use the `#select` method to extract only the elements whose index is even.  
`SET` the newly created array to a new variable.  
`PRINT` the newly created variable.


