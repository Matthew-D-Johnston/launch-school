### Countdown

---

Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

```ruby
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'
```

---

**Line-by-Line Breakdown:**

* Line 1 - 3: we have a method definition:
  * On line 1, the `decrease` method is defined with a `counter` parameter;
  * On line 2, the `counter` variable is reassigned by `1` less than its previous value;
  * On line 3, we have the end of the method.
* Line 5: we have variable assignment where `10` is being assigned to the variable `counter`.
* Line 7 - 10: we have a method invocation with a block:
  * On line 7, we have a method that will execute the block 10 times;
  * On line 8, we have a `puts` call on `counter`, which should print `10` on the first iteration, and will return `nil`;
  * On line 9, we have a `decrease` method call on `counter`, which passes the outer scope `counter` in as an argument, and assigns the value of `10` to the inner scope `counter` variable; since the `decrease` method uses reassignment (i.e `-=`) on `counter`, our inner scope `counter` will now be pointing to a different object than our outer scope `counter`; the inner scope `counter` will decrease by 1, to `9`, but our outerscope variable remains unchanged. This is an example of 'pass by value', rather than 'pass by reference'; since, `decrease` is the last line of the block, the return value of `decrease` will be the return value of the block; hence, `9`.
  * On line 10, we have the end of the block.
* Line 12, we have a `puts` method call on the String `'LAUNCH!'`, which it will print to the screen and return `nil`.

---

**Expected Output:**

```
10
10
10
10
10
10
10
10
10
10
'LAUNCH!'
```

My response was correct.

---

**Modified Code:**

```ruby
counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'
```

This outputs the desired:

```
10
9
8
7
6
5
4
3
2
1
'LAUNCH!'
```

---

**Launch School Solution:**

```ruby
def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
```

---

**Further Exploration:**

We specify `10` two times, which looks a bit redundant. It should be possible to specify it only once. Can you refactor the code accordingly?

```ruby
counter = 10

counter.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'
```



