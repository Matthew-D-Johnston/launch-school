### HEY YOU!

---

[String#upcase!](https://ruby-doc.org/core-2.6.3/String.html#method-i-upcase-21) is a destructive method, so why does this code print `HEY you` instead of `HEY YOU`? Modify the code so that it produces the expected output.

---

```ruby
def shout_out_to(name)
  name.chars.each { |c| c.upcase! }
  
  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
```

---

**Line-by-Line Code Breakdown:**

* Lines 1 – 5: we have method definition where the `shout_out_to` method is defined with the parameter `name`:
  * Line 1: initializes the method definition and identifies the parameter to be used within the method's block.
  * Line 2: we have two method calls on this line: `chars` and `each`;
    * `chars` is called on `name`, which returns an array of the individual characters of the string object assigned to `name` as separate elements;
    * `each` uses the return value of `chars` and passes each element of that array into its block, successively assigning each element to the local variable `c`; `upcase!` is then called on `c`, which destructively changes each element to its uppercase equivalent; the destructive nature of the method means that the array passed to the `each` method is permanently mutated; however, that array has not been assigned to any variable within the method, so the returned value of `each` is not used elsewhere.
  * Line 4: we have a `puts` method call, which will print the return value of `'HEY ' + name` to the screen, and return `nil`; invoking the `name` variable will simply pass whatever `name` was assigned to at the `shout_out_to` method's invocation, as no action was performed on `name` that would permanently mutate it; since line 4 is the last line of the method, and `puts` returns `nil`, the return value of the method is `nil`.
  * Line 5: the line signifies the end of the method definition.
* Line 7: the `shout_out_to` method is invoked on the string object `'you'`:
  * The expected output is: `'HEY YOU'`;
  * However, what will be output by this code is: `'HEY you'`, since the string object `'you'` undergoes no permanent mutation throughout the method's block.

---

**Modified Code:**

```ruby
def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')
```

---

**Launch School's Solution:**

```ruby
def shout_out_to(name)
  puts 'HEY ' + name.upcase
end
```



