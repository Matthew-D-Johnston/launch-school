Lesson 4: Ruby Collections
==========================
## Methods

* `each`

The `each` method is functionally equivalent to using `loop` and represents a simpler way of accomplishing the same task. 


* `select`

To perform selection, `select` evaluates the **return value of the block**. The block returns a value on each iteration, which then gets evaluated by `select`. Similar to a real method, the return value of the block is the return value of the last expression within the block.

`select` performs selection based on the truthiness of the block's return value. If the block's return value is always "truthy", then all of the elements will be selected. When an element is selected, it's place in a _new collection_.


* `map`

Similar to `select`, `map` also considers the return value of the block. The main difference between these two methods is that `map` uses the return value of the block to perform transformation instead of selection.

The key to remember is that _`map` always performs transformation based on the return value of the block_.


**Summary**

Methods like `each`, `select` and `map` are provided by Ruby to allow for simpler implementations of common collection manipulation tasks. Using these methods to iterate, select, and transform a collection is preferred over manually looping.

To further clarify your understanding of these methods and how they work, use the following table as a reference:  

| Method   | Action         | Considers the return value of the block? | Returns a new collection from the method? | Length of the returned collection |
|----------|----------------|------------------------------------------|-------------------------------------------|-----------------------------------|
| `each`   | Iteration      | No                                       | No, it returns the original               | Length of original                |
| `select` | Selection      | Yes, its truthiness                      | Yes                                       | Length of original or less        |
| `map`    | Transformation | Yes                                      | Yes                                       | Length of original                |


These methods each utilize the block's return value in their own way. In the case of `each`, the return value of the block is simply ignored.

