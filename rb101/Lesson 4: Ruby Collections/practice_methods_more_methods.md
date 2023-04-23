Lesson 4: Ruby Collections
==========================
## Practice Problems: Methods and More Methods

**Practice Problem 1**

What is the return value of the `select` method below? Why?
```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```
My response:
```
[1, 2, 3]
```
Because `select` returns a new array with all elements for which the block returns a true value; since the last line of the block is just the string `'hi'` which is a truthy value in Ruby, the new array that is returned contains the same elements as the original.

Launch School's response:
```ruby
# => [1, 2, 3]
```
`select` performs selection based on the _truthiness_ of the block's return value. In this case the return value will always be `'hi'`, which is a "truthy" value. Therefore `select` will return a new array containing all of the elements in the original array.

**Practice Problem 2**

How does `count` treat the block's return value? How can we find out?
```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```
My response:  

`count` uses the return value of the block, which is a boolean, to determine which elements of the array are to be selected and returned; those that return `true` in the block will be included in the return value of the method. 

You can find out in the Ruby documentation for [`Array#count`](http://ruby-doc.org/core-2.6.3/Array.html#method-i-count), where it says, "If a block is given, counts the number of elements for which the block returns a true value."

Launch School response:

If we don't know how `count` treats the block's return value, then we should consult the [docs](http://ruby-doc.org/core-2.6.3/Array.html#method-i-count) for `Array#count`. Our answer is in the description: "If a block is given, counts the number of elements for which the block returns a true value."

Based on this information, we can conclude that `count` only counts an element if the block's return value evaluates to `true`. This means that `count` considers the _truthiness_ of the block's return value.

**Practice Problem 3**

What is the return value of `reject` in the following code? Why?
```ruby
[1, 2, 3].reject do |num|
  puts num
end
```
My response:  
```ruby
# => nil
```
I say the return value of `nil` because the `reject` method is supposed to return a new array containing elements of the old array for which the block does not return `true`; but `puts num` will return `true` for every element so the `reject` method must return `nil`.

Launch School response:
```ruby
# => [1, 2, 3]
```
Since `puts` always returns `nil`, you might think that no values would be selected and an empty array would be returned. The important thing to be aware of here is how `reject` treats the return value of the block. `reject` returns a new array containing items where the block's return value is "falsey". In other words, if the return value was `false` or `nil` the element would be selected.

Thus, I was incorrect when I stated that `puts number` returns `true`. That was a false statement.

**Practice Problem 4**

What is the return value of `each_with_object` in the following code? Why?
```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```
My response:
```ruby
# => ['ant', 'bear', 'cat']
```
According to the [docs](http://ruby-doc.org/core-2.6.3/Enumerable.html#method-i-each_with_object) for `Enumerable#each_with_object`, the metho "returns the initially given object."

Launch School response:
```ruby
# => { "a" => "ant", "b" => "bear", "c" => "cat" }
```
Based on our knowledge of `each`, it might be reasonable to think that `each_with_object` returns the original collection. That isn't the case, though. When we invoke `each_with_object`, we pass in an object ( `{}` here) as an argument. That object is then passed into the block and its updated value is returned at the end of each iteration. Once `each_with_object` has iterated over the calling collection, it returns the initially given object, which now contains all of the updates.

In this code, we start with the hash object, `{}`. On the first iteration, we add `"a" => "ant"` to the hash. On the second, we add `"b" => "bear"`, and on the last iteration, we add `"c" => "cat"`. Thus, `#each_with_object` in this example returns a hash with those 3 elements.

Thus, I was incorrect when interpreting the line, "returns the initially given object". It turns out that the "initially given object" is the `{}`, not the original array that was being passed to the method.

**Practice Problem 5**

What does `shift` do in the following code? How can we find out?
```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```
My response:

`shift` takes the first key-value pair of `hash` and returns it as an array containing both the key and value as separate elements, and modifies the original hash object so that `hash` no longer contains that first key-value pair, as shown below...
```ruby
# => [:a, 'ant']

# hash
# => {:b=>'bear'}
```
We can find this out in the [docs](http://ruby-doc.org/core-2.6.3/Hash.html#method-i-shift) for `Hash#shift`.

Launch School response:

`shift` destructively removes the first key-value pair in `hash` and returns it as a two-item array. If we didn't already know how `shift` worked, we could easily learn by checking the [docs](http://ruby-doc.org/core-2.6.3/Hash.html#method-i-shift) for `Hash#shift`. The description for this method confirms our understanding:

"Removes a key-value pair from _hsh_ and returns it as the two-item array `[ *key, value* ]`, or the hash's default value if the hash is empty."

There are quite a few Ruby methods, and you're not expected to know them all. That's why knowing how to read the Ruby documentation is so important. If you don't know how a method works you can always check the docs.

**Practice Problem 6**

What is the return value of the following statement? Why?
```ruby
['ant', 'bear', 'caterpillar'].pop.size
```
My response:

Return value is...
```ruby
# => 2
```
Originally, there are 3 elements in the array. However, `pop` destructively removes the last element, leaving only `'ant'` and `'bear'` in the array. When `size` is called, the array has only 2 elements so that the final return value will be `2`.

Oops. I just ran the code in irb and realized that because `pop` returns the element that it removes, rather than returning the array that is passed to it as an argument, the `size` method is being passed the last element of the array, which is `'caterpillar'`. Since there are 11 characters in the string, the return value is `11`, not `2`.

Launch School's response:
```ruby
# => 11
```
There are a couple things going on here. First, `pop` is being called on the array. `pop` destructively removes the last element from the calling array and returns it. Second, `size` is being called on the return value by `pop`. Once we realize that `size` is evaluating the return value of `pop` (which is `"caterpillar")`) then the final return value of `11` should make sense.

**Practice Problem 7**

What is the **block**'s return value in the following code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?
```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```
My response:

The block's return value is...
```ruby
# => true
```
This is determined based on the last line of the block, which for the last element of the array being evaluted, `3`, `num.odd?` evaluates to `true` since 3 is an odd number.

The return value of `any?` is...
```ruby
# => true
```
Since there is at least one odd number in the array, `any?` will return `true` based on the condition `num.odd?`. 

Launch School response:

The return value of the block is determined by the return value of the last expression within the block. In this case the last statement evaluated is `num.odd?`, which returns a boolean. Therefore the block's return value will be a boolean, since `Fixnum#odd?` can only return `true` or `false`.

Since the `Array#any?` method returns `true` if the block ever returns a value other than `false` or `nil`, and the block returns `true` on the first iteration, we know that `any?` will return `true`. What is also interesting here is `any?` stops iterating after this point since there is no need to evaluate the remaining items in the array; therefore, `puts num` is only ever invoked for the first item in the array: `1`.

**Practice Problem 8**

How does `take` work? Is it destructive? How can we find out?
```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```
My respone:

`take` will return the first _n_ elements of an array, which in this case, is 2. From reading the docs, I wasn't able to determine whether or not it is destructive or not. My initial guess would be no. But I'll use irb to check...my initial guess was correct and `take` is not destructive, leaving the original array in tact.

Launch School response: If you're unsure of how a method works the best thing to do is to read its [documentation](https://ruby-doc.org/core-2.6.3/Array.html#method-i-take). Along with that, testing the method in `irb` can be very helpful. In this case we can quickly check if `take` is destructive or not by running the code in `irb`.
```ruby
irb :001 > arr = [1, 2, 3, 4, 5]
irb :002 > arr.take(2)
=> [1, 2]
irb :003 > arr
=> [1, 2, 3, 4, 5]
```
By reading the docs and testing the method in `irb`, we're able to determine that `Array#take` selects a specified number of elements from an array. We're also able to verify that it isn't a destructive method.

**Practice Problem 9**

What is the return value of `map` in the following code? Why?
```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```
My response:

My best guess after reading the [docs](http://ruby-doc.org/core-2.6.3/Enumerable.html#method-i-map) on `Enumberable#map` is...
```ruby
# => ['bear']
```
The docs say that `map`, "Returns a new array with the results of running _block_ once for every element in _enum_." Thus, since 'bear' is the only element that evaluates to true for the conditional `if value.size > 3`, it is the only element that will be collected in the new array to be returned.

After running the code in irb, I get the return value of...
```ruby
# => [nil, "bear"]
```
This kind of makes sense to me, and I guess I was partly right. However, I'm not sure why `nil` is the first element instead of say, `false`. I would've thought that since `'ant'` is not greater than 3 that it should return `false`. Perhaps, the point is that `map` only collects elements that return `true`, but since it is evaluating a hash, the `nil` represents the key component of the hash.

Launch School response:
```ruby
# => [nil, "bear"]
```
There are some interesting things to point out here. First, the return value of `map` is an array, which is the collection type that `map` always returns. Second, where did `nil` come from? If we look at the `if` condition (`value.size > 3`), we'll notice that it evaluates to `true` when the length of `value` is greater than `3`. In this case, the only value with a length greater than `3` is `'bear'`. This means that for the first element, `'ant'`, the condition evaluates to `false` and `value` isn't returned.

When none of the conditions in an `if` statement evaluates as `true`, the `if` statement itself returns `nil`. That's why we see `nil` as the first element in the returned array.

**Practice Problem 10**

What is the return value of the following code? Why?
```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```
My response:
```ruby
# => [1, nil, nil]
```
`map` collects the element of the array passed as an argument, evaluates those elements, and gathers the return value of each element into a new array, and then returns that new array. Since the first element, `1`, is not greater than 1, it passes to the `else` condition which just returns the element. For `2` and `3`, both evaluate to true in the `if` condition and thus they are printed to the screen as per the `puts num` expression. However, since `puts num` returns `nil`, that is the element that will be collected by `map` in the new array. That's my best guess.

Launch School response:

We can determine the block's return value by looking at the return value of the last statement evaluated within the block. In this case it's a bit tricky because of the `if` statement. For the first element, the `if` condition evaluates to `false`, which means `num` is the block's return value for that iteration. For the rest of the elements in the array, `num > 1` evaluates to `true`, which means `puts num` is the last statement evaluated, which in turn, means that the block's return value is `nil` for those iterations.

Therefore, the return value of `map` is:
```ruby
# => [1, nil, nil]
```
