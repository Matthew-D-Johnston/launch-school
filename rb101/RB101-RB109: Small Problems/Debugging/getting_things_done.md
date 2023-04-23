### Getting Things Done

---

We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking `move` on line 11 results in a `SystemStackError`. What does this error mean and why does it happen?

```ruby
def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n-1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
```

---

**The Problem:**

When trying to run the code we get a `SystemStackError`. Specifically, the error message indicates that the problem seems to be occurring around line 5 (line 3 in the LS original problem) when the `move` method is called recursively within the `move` method. The message indicates that the `stack level too deep`.

---

**Line-by-Line Code Breakdown:**

* Lines 1 – 4: a `move` method is defined with three parameters: `n`, `from_array`, and `to_array`:
  * Line 1: the `move` method definition is initialized with `def`, and the method is defined with three parameters mentioned above;
  * Line 2: the `shift` method is called on the `from_array` variable, which references an array object;  the `shift` method mutates its caller, the `from_array` array, by permanently removing the first element of the array; this removed element is the return value of the `shift` method call and is shoved to the end of the array object assigned to `to_array` using the `<<` operator;
  * Line 3: the `move` method is called recursively, taking as arguments `n - 1`, `from_array`, and `to_array`; which means the above action described in Line 2 will occur again; however, there will be no end to this process even when the array object assigned to `from_array` is empty nor when the first argument passed to `move` is `0` or less; the method will keep iterating and continue to add `nil` to `to_array` when `from_array` is empty; to remedy the problem, we should invoke an explicit `break` whenever `from_array` becomes empty;
  * Line 4: the method definition is closed with `end`.

---

**Modified Code:**

```ruby
def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n-1, from_array, to_array) unless n == 1 || from_array.empty?
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
```

---

**Launch School Solution:**

```ruby
def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo #=> ['coffee with Tom']
p done #=> ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
```

