### What's wrong with the output?

---

Josh wants to print an array of numeric strings in reverse numerical order. However, the output is wrong. Without removing any code, help Josh get the expected output

```ruby
arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
  y.to_i <=> x.to_i
end

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
```

---

**The Problem:**

Somehow because the `p` method precedes the `sort` method call on `arr`, this disrupts the functioning of `sort` and produces the unexpected output. We know this because if the `p` is removed from the code, we get the expected output.



It appears that `p` is being called on the return value of `arr.sort`  rather than the return value of `arr.sort` followed by the block argument. This seems to be the case because the return value of `p arr.sort` is `["10", "11", "7", "8", "9"]`, which is precisely the unexpected output of our code above. However, when we use the `{}` curly-brace construction for the block, instead of the `do...end` construction, we get our expected output. That is,

```ruby
p arr.sort { |x, y| y.to_i <=> x.to_i }
```

returns `["11", "10", "9", "8", "7"]`, which is the expected outcome we wanted to achieve originally. Thus, we have arrived at our modified code without actually removing any code; we merely change the `do...end` to `{}`.

---

**Modified Code:**

```ruby
arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i }

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["11", "10", "9", "8", "7"]
```

---

**Launch School's Solution:**

###### Solution 1

```ruby
p(
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
)
```

###### Solution 2

```ruby
p arr.sort { |x, y| y.to_i <=> x.to_i }
```

###### Discussion

The main reason why the output was unexpected is because when you use `do...end` block, `p` and `arr.sort` bind more tightly due to Ruby's precedence rules, so you are passing the block to the return value of `p arr.sort`. It's as though you wrote:

```ruby
(p arr.sort) do |x, y|
  y.to_i <=> x.to_i
end
```

In Josh's case, the block is ignored since the return value of `p arr.sort` is not a method call.



One way to get around this precedence issue is to use parentheses as in Solution 1. You can also use braces instead of `do...end` as in Solution 2.



The Ruby documentation does have information on precedence, but this particular behavior isn't covered very well. Our main reason for showing it is that this issue comes up time and again with students.

