Lesson 5: Advanced Ruby Collections
===================================
## Assignment 4: Working with Blocks

**Example 1**
```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```
So what's happening in this, seemingly simple, piece of code? Take it apart and try to describe every interaction with precision.

My analysis:

First of all, we have an array with two nested arrays, `[[1, 2], [3, 4]]`. The `each`method is then being called on this array, which means `each` will iterate through the outer arrays elements, which are the two inner arrays. Within the `each` method's block, we have the command `puts arr.first`, which is a call to print the first element of whatever is being passed to the block, which are the two inner, nested arrays, `[1, 2]` and `[3, 4]`. Thus, on the first iteration, the first element of the first nested array is `1`, so that is what `puts` will print. On the second iteration, the first element of the second nested array will be printed according to the `puts` method.

Launch School's analysis:

The `Array#each` method is being called on the multi-dimensional array `[[1, 2], [3, 4]]`. Each inner array is passed to the block in turn and assigned to the local variable `arr`. The `Array#first` method is called on `arr` and returns the object at index `0` of the current array--in this case the integers `1` and `3`, respectively. The `puts` method then outputs a string representation of the integer. `puts` returns `nil` and, since this is the last evaluated statement within the block, the return value of the block is therefore `nil`. `each` doesn't do anything with this returned value though, and since the return value of `each` is the calling object--in this case the nested array `[[1, 2], [3, 4]]`--this is what is ultimately returned. 

---

So what specific pieces of information are we interested in keeping track of? When evaluating code like this, ask the following questions:
* What is the type of action being performed (method call, block, conditional, etc..)?
* What is the object that action is being performed on?
* What is the side-effect of that action (e.g. output or destructive action)?
* What is the return value of that action?
* Is the return value used by whatever instigated the action?

We can take these pieces of information and set them out in a tabular format: 

| Line | Action                | Object                          | Side Effect                                 | Return Value                    | Is Return Value Used?                        |
|------|-----------------------|---------------------------------|---------------------------------------------|---------------------------------|----------------------------------------------|
| 1    | method call (`each`)  | The outer array                 | None                                        | The calling object              | No, but shown on line 6                      |
| 1-3  | block execution       | Each sub-array                  | None                                        | `nil`                           | No                                           |
| 2    | method call (`first`) | Each sub-array                  | None                                        | Element at index 0 of sub-array | Yes, used by `puts`                          |
| 2    | method call (`puts`)  | Element at index 0 of sub-array | Outputs string representation of an Integer | `nil`                           | Yes, used to determine return value of block |

**Example 2**

Let's take a look at another example:
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => 
```
My analysis:

The type of action being performed here is, first of all, a `map` method call on an array object. That array object has two inner, nested arrays. On each iteration of the `map` method, those inner, nested arrays will be assigned to the local variable `arr` within the method block. Within the block, the first `method` is called, which returns the first element of the object passed to it as an argument. In this case, that argument is the local variable `arr`. Thus, on the first iteration of the `map` method, `arr.first` returns the first element of the first nested array, which means the number `1`, and on the second iteration the first element of the second nested array is `3`. Those return values are each passed to the `puts` method as arguments and are printed as string representations to the screen. The return value of the `puts` method, however, is `nil`. Since the `map` method collects the return values of the block into a new array, which becomes its return value, the `nil` return values of `puts` are returned as part of an array.

Launch School's analysis:

| Line | Action                | Object                          | Side Effect                                 | Return Value                    | Is Return Value Used?                        |
|------|-----------------------|---------------------------------|---------------------------------------------|---------------------------------|----------------------------------------------|
| 1    | method call (`map`)   | The outer array                 | None                                        | New array `[nil, nil]`          | No, but shown on line 6                      |
| 1-3  | block execution       | Each sub-array                  | None                                        | `nil`                           | Yes, used by `map` for transformation        |
| 2    | method call (`first`) | Each sub-array                  | None                                        | Element at index 0 of sub-array | Yes, used by `puts`                          |
| 2    | method call (`puts`)  | Element at index 0 of sub-array | Outputs string representation of an Integer | `nil`                           | Yes, used to determine return value of block |

We can see that the change is a result of how `map` handles the return value of the block. Unlike `each`, `map` performs transformation based on the return value of the block. This means the last line in the block--in this case, `puts`--is critical to understanding this code.

**Example 3**
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

My analysis:

First, I want to rewrite the code with what I think the screen print out and return value will be.
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```
Using LS's table format:

| Line | Action                | Object                          | Side Effect                                 | Return Value                                         | Is Return Value Used?                        |
|------|-----------------------|---------------------------------|---------------------------------------------|------------------------------------------------------|----------------------------------------------|
| 1    | method call (`map`)   | The outer array                 | None                                        | New array `[1, 3]`                                   | No, but shown on line 7                      |
| 1-4  | block execution       | Each sub-array                  | None                                        | `[1, 3]` or `1` and `3`, for each separate iteration | Yes, used by `map` for transformation        |
| 2    | method call (`first`) | Each sub-array                  | None                                        | Element at index 0 of sub-array                      | Yes, used by `puts`                          |
| 2    | method call (`puts`)  | Element at index 0 of sub-array | Outputs string representation of an Integer | `nil`                                                | No                                           |
| 3    | method call (`first`) | Each sub-array                  | None                                        | Element at index 0 of sub-array                      | Yes, used to determine return value of block |

Launch School's solution:

This example will output and return the following:
```ruby
# 1
# 3
# => [1, 3]
```
When breaking down the example, pay close attention to:
* The return value of the block
* The return value of the method
* Any side-effects

Use the following table to gauge the depth you should be thinking at when breaking down the code:

| Line | Action                | Object                               | Side Effect                                 | Return Value                    | Is Return Value Used?                        |
|------|-----------------------|--------------------------------------|---------------------------------------------|---------------------------------|----------------------------------------------|
| 1    | method call (`map`)   | The outer array                      | None                                        | New array `[1, 3]`              | No                                           |
| 1-4  | block execution       | Each sub-array                       | None                                        | Integer at index 0 of sub-array | Yes, used by `map` for transformation        |
| 2    | method call (`first`) | Each sub-array                       | None                                        | Element at index 0 of sub-array | Yes, used by `puts`                          |
| 2    | method call (`puts`)  | Integer at index 0 of each sub-array | Outputs string representation of an Integer | `nil`                           | No                                           |
| 3    | method call (`first`) | Each sub-array                       | None                                        | Element at index 0 of sub-array | Yes, used to determine return value of block |

The main difference to understand in this example is the return value of the block. This is because `puts` is no longer the last expression in the block, thereby changing the block's return value from `nil` to the integer returned by `arr.first`. The block's return value is then used by `map` to perform the transformation, replacing the inner array with an integer. Finally, `map` returns a new array with two integers in it.

**Example 4**
```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```
My analysis:

First, the ouput to the screen will be...
```ruby
# 18
# 7
# 12
```
Second, the value of `my_arr` will be just the original array, `[[18, 7], [3, 12]]`.

Table analysis:

| Line | Action                | Object                                               | Side Effect                                 | Return Value                          | Is Return Value Used?                                     |
|------|-----------------------|------------------------------------------------------|---------------------------------------------|---------------------------------------|-----------------------------------------------------------|
| 1    | variable assignment   | The array returned by the `each` method              | None                                        | `[[18, 7], [3, 12]]`                  | No                                                        |
| 1    | method call (`each`)  | The outer array                                      | None                                        | original object, `[[18, 7], [3, 12]]` | Yes, it is assigned to the variable `my_arr`              |
| 1-7  | outer block execution | Each sub-array                                       | None                                        | `[3, 12]`                             | No                                                        |
| 2    | method call (`each`)  | Each sub-array                                       | None                                        | last object passed to it, `[3, 12]`   | No                                                        |
| 2-6  | inner block execution | Each element of each sub-array                       | None                                        | `nil`                                 | No                                                        |
| 3-5  | conditional statement | Each integer object of the sub-arrays                | None                                        | `nil`                                 | No                                                        |
| 4    | method call (`puts`)  | Each integer object of the sub-arrays greater than 5 | Outputs string representation of an Integer | `nil`                                 | Yes, used as return value for conditional and inner block |

Launch School's solution:

This example will output and return the following:
```ruby
# 18
# 7
# 12
# => [[18, 7], [3, 12]]
```
Within this example, there are multiple return values as well as side-effects. Make sure you are able to clearly understand how the code works, line by line.

| Line | Action                | Object                                     | Side Effect                                   | Return Value                                       | Is Return Value Used?                              |
|------|-----------------------|--------------------------------------------|-----------------------------------------------|----------------------------------------------------|----------------------------------------------------|
| 1    | variable assignment   | n/a                                        | None                                          | `[[18, 7], [3, 12]]`                               | No                                                 |
| 1    | method call (`each`)  | [[18, 7], [3, 12]]                         | None                                          | The calling object: `[[18, 7], [3, 12]]`           | Yes, used by variable  assignment to `my_arr`      |
| 1-7  | outer block execution | Each sub-array                             | None                                          | Each sub-array                                     | No                                                 |
| 2    | method call (`each`)  | Each sub-array                             | None                                          | The calling object: sub-array in current iteration | Yes, used to determine return value of outer block |
| 2-6  | inner block execution | Element of the sub-array in that iteration | None                                          | `nil`                                              | No                                                 |
| 3    | comparison (`>`)      | Element of the sub-array in that iteration | None                                          | Boolean                                            | Yes, evaluated by `if`                             |
| 3-5  | conditional (`if`)    | Element of the sub-array in that iteration | None                                          | `nil`                                              | Yes, used to determine return value of inner block |
| 4    | method call (`puts`)  | Element of the sub-array in that iteration | Outputs a string representation of an Integer | `nil`                                              | Yes, used to determine return value of inner block |

There are 4 return values to pay attention to here: the return value of both calls to `each` and the return value of both blocks. When determining what these return values will be it's important to understand how the method used in the example actually works. In this case we're using `each`, which ignores the return value of the block. This lets us quickly see that the value of `my_arr` will be the array that `each` was called on.

Because `each` ignores the block's return value, this was a relatively straight forward example.

**Example 5**

Next, let's tackle a slightly more complex example.
```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```
What will the return value be in this example?

My analysis:

The return value:
```ruby
# => [[2, 4], [6, 8]]
```

Table analysis:

| Line | Action                        | Object                         | Side Effect | Return Value                                            | Is Return Value Used?                                                  |
|------|-------------------------------|--------------------------------|-------------|---------------------------------------------------------|------------------------------------------------------------------------|
| 1    | method call (`map`)           | `[[1, 2], [3, 4]]`             | None        | `[[2, 4], [6, 8]]`                                      | No                                                                     |
| 1-5  | outer block execution         | Each sub-array                 | None        | The transformed  sub-array of the current iteration     | Yes, used to determine the return value of the outer `map` method call |
| 2    | method call (`map`)           | Each sub-array                 | None        | The transformed sub-array of the current iteration      | Yes, used to determine the return value of the outer block             |
| 2-4  | inner block execution         | Each element of each sub_array | None        | The transformed value of each element of each sub-array | Yes, used to determine the return value of the inner `map` method call |
| 3    | multiplication operator (`*`) | Each Integer of each sub-array | None        | The current integer value multiplied by the number 2    | Yes, used to determine the return value of the inner block             |

Launch School solution:

This example will return the following:
```ruby
# => [[2, 4], [6, 8]]
```
The goal of this code is to multiply each value within the nested array by `2`. We accomplish this by using `map`, which returns a new array containing values transformed based on the block's return value. Except we have to do this twice, paying extra attention to the 4 return values: the two `map` invocations and the two blocks within each invocation.

| Line | Action                | Object                             | Side Effect | Return Value          | Is Return Value Used?                              |
|------|-----------------------|------------------------------------|-------------|-----------------------|----------------------------------------------------|
| 1    | method call (`map`)   | Original array                     | None        | New transformed array | No                                                 |
| 1-5  | outer block execution | Each sub-array                     | None        | New transformed array | Yes, used by top-level `map` for transformation    |
| 2    | method call (`map`)   | Each sub-array                     | None        | New transformed array | Yes, used to determine outer block's return value  |
| 2-4  | inner block execution | Each element within each sub_array | None        | An integer            | Yes, used by inner `map` for transformation        |
| 3    | `num * 2`             | n/a                                | None        | An integer            | Yes, used to determine return value of inner block |

If you look closely and try to understand every line of code, there are actually more than 4 return values you need to pay attention to. By now, you should be starting to realize that the **return value of every expression is important**. You can ignore some certain expressions' return value if it's not being used in that code. But more often than not, some implied return value is being used in subtle ways to affect your code. Pay attention to the details.

**Example 6**

Let's mix it up now with some variation. In the below example, we have an array of hashes, and we want to select all elements where every key matches the first letter of the value. Note that the keys are symbols here, so we'll have to do some conversion before comparison.
```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

My analysis:

1) The `select` method is called on an array object whose elements are hashes.
2) On each iteration of `select`, each hash is assigned to the local `hash` variable and is passed to the block.
3) Within the block, the `all?` method is called on `hash`, and takes two arguments, `key` and `value`, corresponding to the keys and values of the hashes.
4) On the first iteration of `select`, the hash `{ a: 'ant', b: 'elephant' }` is passed as the argument; the `all?` method is called on this hash, so that the first iteration of `all?` assigns `key` to `:a` and `value` to `ant`; on the second iteration of `all?`, `key` is assigned to `:b` and `value` to `elephant`.
5) Within `all?` method block, we have a comparison operator `==` that compares the first character of the current value with the key-converted-to-a-string.
6) On the first iteration of `select` and the first iteration of `all?`, the comparison operator will return `true`; on the second iteration of `all?`, the comparison operator will return `false`. Thus, for the first iteration of `select`, `false` will be the return value and so the first hash will not be selected to be a part of the return value of `select`.
7) On the second iteration of `select`, there is only one element within the hash, so there will only be one iteration of `all?`; the comparison operator will return `true` thus the second iteration of `select` also returns `true` and the hash will be selected to be a part of the return value of `select`.
8) Thus, the final return value is an array containing the elements that returned true by the block of the `select` method: `[{ :c => "cat" }]`.

Table analysis:

| Line | Action                     | Object                                            | Side Effect | Return Value                                                    | Is Return Value Used?                                 |
|------|----------------------------|---------------------------------------------------|-------------|-----------------------------------------------------------------|-------------------------------------------------------|
| 1    | method call (`select`)     | An array of hashes                                | None        | An array of hashes that return `true` within the method's block | No                                                    |
| 1-5  | outer block execution      | Each hash                                         | None        | Each hash that returns `true` within the block                  | Yes, used to determine the return value of `select`   |
| 2    | method call (`all?`)       | Each hash                                         | None        | Boolean                                                         | Yes, used to determine the outer block's return value |
| 2-4  | inner block execution      | Each key-value pair                               | None        | Boolean                                                         | Yes, used to determine the return value of `all?`     |
| 3    | index call `[0]`           | The value of each element of each hash            | None        | A string: the first character of each vaue                      | Yes, used by the comparison operator (`==`)           |
| 3    | method call (`to_s`)       | Convert to a string representation                | None        | A string representation of its calling object                   | Yes, used by the comparison operator (`==`)           |
| 3    | comparison operator (`==`) | Compare the values on either side of the operator | None        | Boolean                                                         | Yes, used to determine the inner block's return value |

Launch School solution:

The first thing to notice here is the use of the `all?` method within the `select` block. Since `#select` specifically cares about the _truthiness_ of the block's return value, using a method that returns a boolean works well. `all?` will return `true` if the block passed to it never returns a value of `false` or `nil` for every key/value pair in the hash. We're using `value[0] == key.to_s` to test whether all keys match the first letter of all their associated values. Note that the only hash that meets this criteria is `{:c => 'cat'}`, and the return value is an array.

What would happen if, instead of using `all?`, we used `any?`. Why would this affect the return value of `select`?

My response: 

Using `any?` instead of `all?` would mean that `select` would now return an array with both hashes, since the hash that was eliminated from selection by the `all?` method would be included by the `any?` method. `any?` returns `true` if any of the elements within the collection returns true; thus, since the first hash contains one key-value pair that returns `true`, the `any?` method returns `true` for that hash and it will be selected by the `select` method.

**Example 7**

**Example 8**

**Example 9**

This example contains a triple-level nested array. Take your time and try to break down each component. Hint: the top-level array is a 2-element array.
```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0 
    end
  end
end
# => [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]
```
**Example 10**

Let's say we have the following data structure of nested arrays and we want to increment every number by 1 without changing the data structure.
```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end
```
This example is more complicated than the rest, but at this point you should be able to break it down effectively. Use the tools you've learned about in this lesson and take as much time as needed. Work on breaking down each component and understanding the return value of each expression. What will be the final return value? Check the solution only after you've tried this on your own.

My analysis:

Line 1: `map` method being called on an array object: `[[[1, 2,], [3, 4]], [5, 6]]`  
Lines 1-11: top-level block execution, assigning each sub-array--`[[1, 2], [3, 4]]` and `[5, 6]`--to the local variable `arr` on each successive iteration of `map`.  
Line 2: `map` method call on each sub-array of the original array.  
Lines 2-10: middle-level block execution, assigining each element of the sub-arrays to the local variable `el`; for the first sub-array, the elements are arrays--`[1, 2]` and `[3, 4]`; for the second sub-array, the elements are integers--`5` and `6`.  
Line 3: we have an `if` clause, a `to_s` string conversion, a `size` method call, and a `==` comparison operator. The `if` implies we are looking for the condition following it to return a boolean value. For the array elements, the size will be greater than the comparison value of `1`, which means both of these sub-arrays will not be operated on in the block of the `if` condition statement. For the integer elements, the size of each will be `1` and thus will return a value of `true` when compared with `1`, and thus will be executed on within the `if` conditional statement block.  
Lines 3-9: we have the `if/else` block acting on each of the elements of each of the sub-arrays the original array. The return values of this block will be used as the return values of the `map` methods block.
Line 4: we have a `+` addition operation, that will take the integer values passed through the `if` statement block and add `1` to each of them. This return value will be used by the `map` method. Since, only the elements of the second sub-array will be passed through this portion of the `if/else` block, the return value here will be `[6, 7]`.  
Line 5: invoking of the `else` statment portion of the `if/else` block.  
Line 6: `map` method call, assigning the elements of the sub-sub-array to the local variable name `n`.  
Lines 6-8: lower-level block execution on each element of the sub-sub-arrays.
Line 7: we have a `+` addition operator, which will add `1` to each  element of the sub-sub-arrays. Thus, the return value of the addition operator will be each integer + `1`, which will be used to return a value for the lower-level block of `[2, 3]` and `[4, 5]`, consecutively; those return values will be used as the return value of the mid-level block, hence, `[[2, 3], [4, 5]]`, which will be used, along with the other return value of the mid-level block, `[6, 7]`, as the return value for the top-level block; hence, `[[[2, 3], [4, 5]], [6, 7]]`, which will be the return value of the entire block of code.  

| Line | Action                                | Object                                                                        | Side Effect | Return Value                                                                           | Is Return Value Used?                                                                                 |
|------|---------------------------------------|-------------------------------------------------------------------------------|-------------|----------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| 1    | method call (`map`)                   | an Array                                                                      | None        | `[[[2, 3], [4, 5]], [6, 7]]`                                                           | No                                                                                                    |
| 1-10 | top-level block execution             | Each sub-array                                                                | None        | A new transformed array                                                                | Yes, used to determine the return value of the `map` method call                                      |
| 2    | method call (`map`)                   | Each sub-array                                                                | None        | First call: `[[2, 3], [4, 5]]` Second call: `[6, 7]`                                   | Yes, used to determine the return value of the top-level block                                        |
| 2-9  | mid-level block execution             | Each element of each sub-array (i.e. 2 arrays, and 2 integers)                | None        | New transformed arrays on each successive call                                         | Yes, used to determine the return value of the second `map` method call                               |
| 3-9  | `if/else` conditional block execution | Each element of each sub-array                                                | None        | Transformed sub-array and integer values                                               | Yes, used to determine the return value of the mid-level block                                        |
| 3    | `if` clause                           | Each element of each sub-array                                                | None        | n/a                                                                                    | n/a                                                                                                   |
| 3    | comparison operation (`==`)           | n/a                                                                           | None        | Boolean                                                                                | Yes, used to determine if code in `if` conditional is to executed on the value of the current element |
| 3    | method call (`size`)                  | A string representation of the current element                                | None        | An integer value denoting the size of the string representation of the current element | Yes, used as the comparison value by the `==` comparison operator                                     |
| 3    | method call (`to_s`)                  | Each element of the sub-arrays                                                | None        | An integer representation of each element                                              | Yes, used by the `size` method                                                                        |
| 4    | addition operation (`+`)              | Each element of the sub-arrays that returned `true` for the `if` clause       | None        | An integer value                                                                       | Yes, used to determine the return value of the `if/else` conditional block                            |
| 5    | `else` clause                         | Each element of each sub-array that does not return `true` to the `if` clause | None        | n/a                                                                                    | n/a                                                                                                   |
| 6    | method call (`map`)                   | Each element of the sub-sub-arrays                                            | None        | First call: `[2, 3]` Second call: `[4, 5]`                                             | Yes, used to determine the return value of the `if/else` conditional block                            |
| 6-8  | low-level block execution             | Each element of the sub-sub-arrays                                            | None        | New transformed sub-arrays on each successive call                                     | Yes, used to determine return value of the `map` method call                                          |
| 7    | addition operation (`+`)              | Integers                                                                      | None        | New transformed integer values (i.e. addition of `1`)                                  | Yes, used to determine return value of the low-level block                                            |

Launch School solution:

This example will return the following:
```ruby
# => [[[2, 3], [4, 5]], [6, 7]]
```
The tricky part about this example is that the original array has uneven nested levels. If we want to add `1` to each value we first need to find a way to access those values, regardless of how many arrays they're nested in. To do this, we determine if the current element is an array or an integer and then execute the appropriate code.

`map` is a good choice for this task because it returns a new array containing transformed values. This way we can ultimately return a new array with the same nested levels as the original.

In practice, this type of nested data processing is typically a sign of bad design. But if you ever find yourself in that situation, you should be confident in your ability to work through it.

**Some important things to remember:**

* If at first code appears opaque or complex, take the time to break it down step by step.  
* If necessary use some sort of systematic approach (such as the tabular method outlined in this assignment).  
* Figure out what is happening at each step, paying particular attention to:  
- Return value  
- Side effects  
* Pay attention to the return values of all statements in your code, especially where implicit return values are being relied on.  
* Make sure you have a clear understanding of the underlying concepts such as data structure, loops, iterative methods and the blocks passed to them (go back over earlier assignments if necessary).  
* Be clear about the method implementation of the iterative method(s) being used, especially:  
- What values are passed to the block  
- What the method does with the return value of the block  
* If you are unclear about a method implementation, a good initial step is to refer to the [Ruby Docs](http://ruby-doc.org/)
