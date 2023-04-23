##### RB130 - Ruby Foundations: More Topics > Easy 1

---

## Optional Blocks

**Problem:**  

Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.  

---

**Examples / Test Cases:**  

```ruby
compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'
```

---

**Data Structure:**  

**_Inputs_**

* The method will take a block argument, which could consist of different types of objects.

**_Outputs_**

* A variety of different objects depending on the arguments supplied to the block argument.
* If no block argument is given, the return value should be the following String object: `'Does not compute.'`.

---

**Algorithm:**  

* Begin by initiating the method definition: `def compute`
* We will want to check whether or not the user of the method has supplied a block argument; we can do this with a ternary operator and the `block_given?` method. If a block is supplied, then we will yield to the block, and if not, then we want to return a String object: `block_given? ? yield : 'Does not compute.'`

---

**Code:**  

```ruby
def compute
  block_given? ? yield : 'Does not compute.'
end
```

---

**Launch School's Solution:**  

```ruby
def compute
  return 'Does not compute.' unless block_given?
  yield
end
```

---

**Further Exploration:**  

Modify the `compute` method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of calling this new version of `compute`, including a no-block call.

---

**My FE Solution:**  

```ruby
def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

puts compute(3) { |n| 5 + n } == 8
puts compute('Hello') { |word| word + ' World' } == 'Hello World'
puts compute(2) == 'Does not compute.'
```

