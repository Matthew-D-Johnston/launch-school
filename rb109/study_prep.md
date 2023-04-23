## Study Preparation for Launch School's RB109 Assessment

**Specific Topics of Interest:**

Be able to explain clearly the following topics:

* local variable scope, especially how local variables interact with method invocations with blocks and method definitions;
* how passing an object into a method definition can or cannot permanently change the object;
* working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc.). Review the two lessons on these topics thoroughly;
* [variables as pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers);
* [puts vs. returns](https://launchschool.com/books/ruby/read/methods#putsvsreturnthesequel);
* false vs. nil and the idea of "truthiness";
* method definition and method invocation;
* implicit return value of method invocation and blocks.



### Local Variable Scope

----------------------

**Pages**

* Lesson 2: Small Programs -- [Variable Scope](https://launchschool.com/lessons/a0f3cd44/assignments/fff0b9db)
* Open Bookshelf: Intro to Programming -- Variables: [Variable Scope](https://launchschool.com/books/ruby/read/variables#variablescope)
* Lesson 2: Small Programs -- [Pass by Reference vs. Pass by Value](https://launchschool.com/lessons/a0f3cd44/assignments/4b1ad598)



**Highlights**

* A variable's scope determines where in a program a variable is available for use. A variable's scope is defined by where the variable is initialized or created. In Ruby, variable scope is defined by a _block_. A block is a piece of code following a method invocation, usually delimited by either curly braces `{}` or `do/end`. Be aware aware that not all `do/end` pairs imply a block.
* Note: the key distinguishing factor for deciding whether code delimited by `{}` or `do/end` is considered a block (and thereby creates a new scope for variables), is seeing if the `{}` or `do/end` immediately follows a method invocation.
* **Inner scope can access variables initialized in an outer scope, but not vice versa.**

```ruby
a = 5

3.times do |n|
  a = 3
  b = 5
end

puts a			# a is accessible here, in the outerscope, because it was originally initialized in the outerscope.
puts b			# b is not accessible here, as it was initialized within the inner scope of the method block.
```

* The two major areas where we encounter local variable scoping rules are related to _method definition_ and _method invocation with a block_.
* Ruby blocks create a new scope for local variables. You can think of the scope created by a block following a method invocation as an _inner scope_. Nested blocks will create nested scopes. A variable's scope is determined by where it is initialized.
* **Variables initialized in an outer scope can be accessed in an inner scope, but not vice versa.**
* Inner scope can access outer scope variables and it is possible to _change_ variables from an inner scope and have that change affect the outer scope.
* This means that when we instantiate variables in an inner scope, we have to be very careful that we're not accidentally re-assigning an existing variable in an outer scope. This is a big reason for avoiding single-letter variable names.
* Nested blocks follow the same rules of inner and outer scoped variables. When dealing with nested blocks, our usage of what's "outer" or "inner" is going to be relative. We'll switch vocabulary and say "first level", "second level", etc.

```ruby
a = 1							# first level variable

loop do						# second level
  b = 2
  
  loop do					# third level
    c = 3
    puts a				# => 1
    puts b				# => 2
    puts c				# => 3
    break
  end
  
  puts a					# => 1
  puts b					# => 2
  puts c					# => NameError
  break
end

puts a						# => 1
puts b						# => NameError
puts c						# => NameError
```

* **Variable Shadowing:** Some blocks take a parameter, which is captured between the `|` symbols (i.e. `[1, 2, 3].each { |n| puts n }`, where `n` is the parameter that represents each element of the array as the `each` method iterates through the array). What happens if we had a variable named `n` in the outer scope?
* We know that the inner scope has access to the outer scope, so we'd essentially have two local variables in the inner scope with the same name. When that happens, it's called **_variable shadowing_**, and it prevents access to the outer scope local variable. For example:

```ruby
n = 10

[1, 2, 3].each do |n|
  puts n
end
```

* The `puts n` will use the block parameter `n` and disregard the outer scoped local variable. Variable shadowing also prevents us from making changes to the outer scoped `n`.
* You want to avoid variable shadowing, as it's almost never what you intended to do. Choosing long and descriptive variable names is one simple way to ensure that you don't run into any of these weird scoping issues. And if you do run into these issues, you'll have a much better chance of debugging it if you have clear variable names.
* However, the following example is **not** an example of variable shadowing:

```ruby
def change_name(name)
  name = 'bob'		# does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name					# => jim
```

* Note that the code example above has two different local variables named `name`. There is one scoped within the method, and there is one in the main scope. This is not variable shadowing, because the main scope variable is not accessible to the method. Within the method, we could have named the variable something other than `name`.

* **Method Definitions:** The only variables a method definition has access to must be passed into the method definition (Note: we're only talking about local variables for now). A method definition has no notion of "outer" or "inner" scope -- you must explicitly pass in any parameters to a method definition. 
* Example 1: a method definition can't access local variables in another scope

```ruby
a = 'hi'

def some_method
  puts a
end

# invoke the method
some_method			# => NameError: undefined local variable or method `a' for main: Object
```

* Example 2: a method definition can access objects passed in

```ruby
def some_method(a)
  puts a
end

some_method(5)	# => 5
```

* In the example above, the integer `5` is passed into `some_method` as an argument, assigned to the method parameter, `a`, and thus made available to the method body as a local variable. That's why we can call `puts a` from within the method definition.
* **Remember: local variables that are not initialized _inside_ a method definition must be defined as parameters.**
* **Blocks within Method Definitions:**
* Unsurprisingly, the rules of scope for a method invocation with a block remain in full effect even if we're working inside a method definition.





### Passing Objects into Method Definitions: Mutating the Caller

---------------------------

**Pages**

* Lesson 2: Small Programs -- [Pass by Reference vs. Pass by Value](https://launchschool.com/lessons/a0f3cd44/assignments/4b1ad598)
* Open Bookshelf: Intro to Programming -- Methods: [Mutating the Caller](https://launchschool.com/books/ruby/read/methods#mutatingthecaller)
* Launch School Blog: [Variable References and Mutability of Ruby Objects](https://launchschool.com/blog/references-and-mutability-in-ruby)
* Launch School Blog: [Mutating and Non-Mutating Methods in Ruby](https://launchschool.com/blog/mutating-and-non-mutating-methods)
* Launch School Blog: [Object Passing in Ruby -- Pass by Reference or Pass by Value](https://launchschool.com/blog/object-passing-in-ruby)



**Highlights**

* In most programming languages, there are two ways of dealing with objects passed into methods: 1) You can either treat these arguments as "references" to the original object or as "values", which are copies of the original.
* "pass by value" generally means that the method only has a _copy_ of the original object, which means that operations performed on the object within the method have no effect on the original object outside the method. Some Rubyists say Ruby is "pass by value" because re-assigning the object within the method doesn't affect the object outside the method.
* However, it's not quite that simple. If Ruby was pure "pass by value", that means there should be no way for operations within a method to cause changes to the original object. But you can plainly do this in Ruby (e.g. when performing destructive method operations using the bang operator `!`).
* Being able to change the original object would imply that Ruby is "pass by reference", because operations within the method affected the original object. However, not all operations affect the original object.
* Intead, Ruby exhibits a combination of behaviors from both "pass by reference" as well as "pass by value". Some people call this _pass by reference of the value or call by sharing_. Whatever you call it, the most important concept you should remember is: **when an operation within the method mutates the caller, it will affect the original object.**
* When you pass an object as an argument to a method, the method can -- in theory -- either modify the object, or leave it unmodified. It's easy enough to see that any method can avoid modifying its arguments. However, whether or not the method can modify an argument is less clear; the ability to modify arguments depends in part on the mutability or immutability of the object represented by the argument, but also on how the argument is passed to the method.
* Some languages make copies of method arguments, and pass those copies to the method -- since they are merely copies, the original objects can't be modified. Objects passed to methods in this way are said to be _pass by value_, and the language is said to be using a _pass by value_ object passing strategy.
* Other languages pass references to the method instead -- a reference can be used to modify the original object, provided that object is mutable. Objects passed to methods in this way are said to be _passed by reference_, and the language is said to be using a _pass by reference_ object passing strategy.
* Many languages employ both object passing strategies. One strategy is used by default; the other is used when a special syntax, keyword, or declaration is used. Some languages may even employ different defaults depending on the object type -- for example, numbers may be passed using a pass by value strategy, while strings may be passed using a pass by reference strategy.
* Methods can be either mutating or non-mutating. As you might expect, mutating methods change something; non-mutating methods do not. The object that may or may not be mutated is of concern when discussing whether a method is mutating or non-mutating. For example, the method `String#sub!` is mutating with respect to the String used to call it, but non-mutating with respect to its arguments.
* A method is said to be non-mutating with respect to an argument or its calling object if it does not modify it. Most methods you will encounter do not mutate their arguments or caller. Some do mutate their caller, but few mutate the arguments.
* All methods are non-mutating with respect to immutable objects. A method simply can't modify an immutable object. Thus, any method that operates on numbers and boolean values is guaranteed to be non-mutating with respect to that value.
* Of particular interest when discussing non-mutating methods is assignment with `=`. As we saw in the [Variable References and Mutability](https://launchschool.com/blog/references-and-mutability-in-ruby) article, assignment merely tells Ruby to bind an object to a variable. This means that assignment does not change an object; it merely connects the variable to a new object. While `=` is not an actual method in Ruby, it acts like a non-mutating method, and should be treated as such.
* Passing a variable as an argument to a method is like variable assignment with `=`. The method parameter is now another name pointing to the same object that the variable passed as an argument is pointing to. See below example:

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```

* In the above example, when `s` is passed into the `fix(value)` method, what happens is analogous to what were to happen if we assigned the variable `value` to `s` using assignment: `value = s`. Now, both `value` and `s` are pointing to the same String object whose value is `'hello'`. Since both `upcase!` and `concat` are destructive methods (i.e. they mutate the caller), no new String object is created; rather, the object to which both `value` and `s` refer to is mutated. Both variables still refer to the same String object, but that object now contains the value `'HELLO!'`.
* Contrast the above example with the following modification:

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

* Here, passing `s` as an argument to `fix(value)` assigns `value` to the String object referenced by `s`. So far nothing has changed from our first example. However, the `upcase` method in this instance is non-destructive. Thus, `value = value.upcase` reassigns `value` to a new String object, which will be the return value of `value.upcase`. At this point, `value` and `s` are referencing two completely separate objects: `s` is still referencing the String object containing the value `'hello'`, but `value` is now referencing the new String object containing the value `'HELLO'`.  From this point on, any method called on `value`, whether destructive or non-destructive, will not affect `s`. Thus, even though `concat` is a destructive method, it will mutate the String object referenced by `value` but since `s` is referencing a completely different object, `s` will be unaffected.

![using-assignment](/Users/matthewjohnston/Launch School/RB109 Assessment/using-assignment.png)

* Be aware that any mutating operations prior to the assignment, `=`, may still take place:

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)
```

* In the above example, once again, passing `s` to `fix(value)` assigns the object referred to by `s` to the method parameter `value`. Since the first operation on `value` is `<<`, which is a destructive method, the object that both `s` and `value` are referencing will mutate, and will now contain the value `'helloxyz'`. But, as in the second example, the line `value = value.upcase` acts to reassign `value` to reference a new object, which now contains the value `'HELLOXYZ'`; `s`, on the other hand, still refers to the original String object, which now contains the value `'helloxyz'`. Any method operation on `value` from here on will only affect the object referenced by `value` and not the one referenced by `s`.
* These types of issues arise not only with assignment, but also with assignment operators like `*=`, `+=`, and `%=`. These are all implemented in terms of assignment, and that assignment always causes the target to reference a possibly different object. 
* Now consider this example:

```ruby
>> def fix(value)
--   value = value.upcase!
--   value.concat('!')
-- end
=> :fix

>> s = 'hello'
=> "hello"

>> s.object_id
=> 70363946430440

>> t = fix(s)
=> "HELLO!"

>> s
=> "HELLO!"

>> t
=> "HELLO!"

>> s.object_id
=> 70363946430440

>> t.object_id
=> 70363946430440
```

* Although the first operation run by the `fix(value)` method, in this instance, uses assignment, `=`, we see that on the right hand side of the `=` we have `value` being passed through a destructive method, `upcase!`. This means that the return value of this method will be the mutated object that both `s` and now `value` are referencing. The assignment merely assigns `value` to the original, albeit, modified String object. No reassignment to a new String object occurs in this instance.
* A method is said to be mutating with respect to an argument or its caller if it modifies it.
* Many, but not all, methods that mutate their caller use `!` as the last character of their name. However, this is not guaranteed to be the case. For instance, `String#concat` is a mutating method, but it does not include a `!`.
* Indexed assignment is mutating.
* Indexed assignment, such as that used by String, Hash, and Array objects can be confusing:

```ruby
str[3] = 'x'
array[5] = Person.new
hash[:age] = 25
```

* This looks exactly like assignment, which is non-mutating, but is, in fact, mutating. `#[]` modifies the original object (the String, Array, or Hash). It doesn't change the binding of each variable.
* Consider this code:

```ruby
def fix(value)
  value[1] = 'x'
  value
end

s = 'abc'
t = fix(s)
p s            # "axc"
p t            # "axc"
p s.object_id  # 70349153406320
p t.object_id  # 70349153406320
```

* Earlier, we saw similar code that merely assigned to `value`, and we saw that performing assignment bound `value` to a completely new String. Thus, `s` and `t` referenced different objects.
* Here, though, we are using indexed assignment instead, and, perhaps surprisingly, the binding does not change. Even after the assignment to `value[1]`, `value` still references the same (albeit mutated) String object.
* The reason for this is that indexed assignment is a method that a class must supply if it needs indexed assignment. This method is named `#[]=`, and `#[]=` is expected to mutate the object to which it applies. It does not create a new object.
* Concatenation is mutating.
* The `#<<` method used by collections like Arrays and Hashes, as well as the String class, implements concatenation; this is very similar to the `+=` operator. However, there is a major difference; `+=` is non-mutating, but `#<<` is mutating.
* Setters are mutating.
* Setters are very similar to indexed assignment; they are methods that are defined to modify the state of an object. Both employ the `something = value` syntax, so they superficially look like assignments. With indexed assignment, the elements of a collection (or the characters of a String) are replaced; with setters, the state of the object is modified, usually by modifying an instance variable.
* Setter invocation looks like this:

```ruby
person.name = 'Bill'
person.age = 23
```

* This looks exactly like assignment, which is non-mutating, but, since these are setter calls, they actually mutate the object bound to `person`.
* We won't go into a lot of detail to illustrate this; suffice to say that a detailed discussion would be nearly identical to the discussion of indexed assignment.
* It's possible to define setter methods that don't mutate the original object. Such setters should still be treated as mutating since they don't create new copies of the original object.
* Thus, some conclusions: assignment does not mutate objects but instead binds variables to new objects, while setter methods and indexed assignment do mutate objects.
* Useful definition: the _caller_ (sometimes called the receiver) of a method call is the object on which a method is called. 
* Callers can be thought of as implied arguments to methods. As such, we need to include method callers in any discussion of object passing.



### Working with Collections (Array, Hash, String) and Popular Collection Methods (each, map, select, etc.)

------------

**Pages**

* Lesson 4: Ruby Collections -- [Collections Basics](https://launchschool.com/lessons/85376b6d/assignments/39c98ed0)
* Lesson 4: Ruby Collections -- [Looping](https://launchschool.com/lessons/85376b6d/assignments/0383876a)
* Lesson 4: Ruby Collections -- [Selection and Transformation](https://launchschool.com/lessons/85376b6d/assignments/ced192be)
* Lesson 4: Ruby Collections -- [Methods](https://launchschool.com/lessons/85376b6d/assignments/3034b4e0)



**Highlights**

* Collections are made up of individual elements.
* Strings and arrays are ordered, zero-indexed collections.
* Hashes are another very common collection data structure that, instead of using an integer-based index, use key-value pairs, where the key or the value can be any type of Ruby object.
* There are a few things that can catch you off guard when referencing elements in a collection and you need to be aware of these in order to avoid unintended behavior in your code.
* Referencing an out-of-bounds index in this way returns `nil`. This is not necessarily a problem for a string, since we know that `nil` is an invalid return value; with an array, `nil` could be a valid return value since arrays can contain any other type of object, including `nil`.
* When working with collections, it's common to perform a single action on each element in a collection. Instead of writing the action over and over again, loops can be used to perform an action on many, if not all, of the elements in a collection.
* Looping comprises four basic elements: a loop, a counter, a way to retrieve the current value, and a way to exit the loop.
* Besides _iteration_, the two most common actions to perform on a collection are _selection_ and _transformation_.
* Selection is picking certain elements out of the collection depending on some criterion. If there are `n` elements in a collection, selection results in `n` or less elements.
* Transformation refers to manipulating every element in the collection. If there are `n` elements in a collection, transformation always results in exactly `n` elements.
* Selection and transformation both utilize the basics of looping: a loop, a counter, a way to retrieve the current value, and a way to exit the loop. In addition, selection and transformation require _some criteria_; selection uses this criteria to determine which elements are selected, while transformation uses this criteria to determine how to perform the transformation.
* **When performing transformation, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned.**
* We often want to perform iteration, selection or transformation operations on a collection. Using these 3 actions, we can manipulate a collection nearly any way we need to.
* Using loops, such as `loop` or `for`, to iterate over a collection can become very repetitive. Ruby provides an easier way to work with collections through the use of built-in methods, such as `each`, `select`, and `map`.
* `each`
* Iterating over a collection is such a common task that Ruby provides a method to do just that. The `each` method is functionally equivalent to using `loop` and represents a simpler way of accomplishing the same task.
* We can iterate over an array or hash in a manual way by using `loop`, or we can iterate more idiomatically using `each` -- they're equivalent, for the most part. One of the main differences between them, however, is the return value. Once `each` is done iterating, it _returns the original collection_.
* `select`
* We've explored a basic approach to performing selection with `loop`, but arrays and hashes also have a built-in way to iterate over a collection and perform selection: through a `select` method that makes doing this significantly easier.
* To perform selection, `select` evaluates the **return value of the block.** The block returns a value on each iteration, which then gets evaluated by `select`. Similar to a real method, the return value of the block is the return value of the last expression within the block.
* When evaluating the block's _return value_, `select` only cares about its _truthiness_. Everything in Ruby is considered "truthy" except for `nil` and `false`. That's not exactly the same thing as saying everything except `nil` and `false` has a value of `true` in Ruby, but only that it is "truthy". It's a small, but important, distinction.
* If the return value of the block is "truthy", then the element during that iteration will be selected. If the return value of the block is "falsey" then the element will not be selected.
* `select` performs selection based on the truthiness of the block's return value. If the block's return value is always "truthy", then all of the elements will be selected. When an element is selected, it's placed in a _new collection_. In the above example, once `select` is done iterating, it _returns a new collection_ containing all of the selected elements, because the selection criteria -- the block's return value -- is truthy for every element in the array.
* Example:

```ruby
[1, 2, 3].select do |num|
  num + 1
end

# => [1, 2, 3]
```

* Since `num + 1` is "truthy", and is the last expression with the `select` block, the `select` method will return a new array with all of the elements contained in the original array.
* Now examine the following example:

```ruby
[1, 2, 3].select do |num|
  num + 1
  puts num
end

# 1
# 2
# 3
# => []
```

* `select` now returns an empty array. Why is that? Since `puts num` is now the last evaluated expression in the block, it is the return value of this expression which determines the return value of the block. We know that `puts` always returns `nil`, therefore the return value of the block will now be `nil`, which is considered a "falsey" value. In other words, `select` won't select _any_ elements because the return value will _always_ be falsey.
* `map`
* Similar to `select`, `map` also considers the return value of the block. The main difference between these two methods is that `map` uses the return value of the block to perform transformation instead of selection.

```ruby
[1, 2, 3].map do |num|
  num * 2
end

# => [2, 4, 6]
```

* In this example, the return value of the block is the product of `num` and `2`. `map` then takes this value and places it in a **new collection.** This process is repeated for each element in the original collection.
* What happens if we write some code in the block that's not a transformation instruction?

```ruby
[1, 2, 3].map do |num|
  num.odd?
end

# => [true, false, true]
```

* The key to remember here is that `map` _always performs transformation based on the return value of the block._ In this case, the return value of the block will be a boolean. This means that the collection returned by `map` will be an array of booleans.
* What will the return value of `map` be in the following example?

```ruby
[1, 2, 3].map do |num|
  num.odd?
  puts num
end

# 1
# 2
# 3
# => [nil, nil, nil]
```

* What if the only statement within the block is a string? What will the return value of `map` be?

```ruby
[1, 2, 3].map do |num|
  'hi'
end

# => ['hi', 'hi', 'hi'}]
```

* Since `'hi'` is the only statement within the block, the return value of the block is `'hi'`, which `map` will use as the transformation criteria. Therefore, the above code will return an array where each element is `'hi'`.
* Use the following table of the `each`, `select`, and `map` methods as a reference:

| **Method** | **Action**     | **Considers the return value of the block?** | **Returns a new collection from the method?** | **Length of the returned collection** |
| ---------- | -------------- | -------------------------------------------- | --------------------------------------------- | ------------------------------------- |
| `each`     | Iteration      | No                                           | No, it returns the original                   | Length of original                    |
| `select`   | Selection      | Yes, its truthiness                          | Yes                                           | Length of original or less            |
| `map`      | Transformation | Yes                                          | Yes                                           | Length of original                    |

### Variables as Pointers

-----------

**Pages**

* Open Bookshelf: Intro to Programming -- More Stuff: [Variables as Pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)
* Launch School Blog: [Variable References and Mutability of Ruby Objects](https://launchschool.com/blog/references-and-mutability-in-ruby)



**Highlights**

* **Variables are pointers to physical space in memory.** In other words, variables are essentially labels we create to refer to some physical memory address in your computer.

![variables_pointers1](/Users/matthewjohnston/Launch School/RB109 Assessment/variables_pointers1.jpg)

* From the above diagram, we can see that the code `a = "not here"` reassigned the variable `a` to a completely different address in memory; it's now pointing to an entirely new string. This is what the `=` operator does.
* It's important to understand that different memory space can in fact hold the same value, but they are still different places in memory. For example, if our last line of code was `a = "hi there"`, the result would still be the same: `a` and `b` in that case would still point to _different_ addresses in memory; they would just happen to have the same value.
* Here's another example:

![variables_pointers2](/Users/matthewjohnston/Launch School/RB109 Assessment/variables_pointers2.jpg)

* The line of code `a << ", Bob"` did **not** result in reassigning `a` to a new string. Rather, it _mutated the caller_ and modified the existing string, which is also pointed to by the variable `b`. This explains why in this code, `b` reflects the changes to `a` -- they're both pointing to the same thing.
* Some operations will mutate the actual address space in memory, thereby affecting all variables that point to that address space. Some operations will not mutate the address space in memory, and instead will re-point the variable to a new address space in memory.
* This also applies to variabels that are arrays, hashes, or any data structure that has methods that mutate the caller. If you call a method that _mutates the caller_, it will change the value in that address space, and any variables also pointing there will be affected. Therefore, always pay attention whether your variables are pointing to the same object (space in memory) or if they are dealing with copies that occupy different address space in memory.
* Important note: When passing in arguments to a method, we're essentially assigning a variable to another variable, like we did with `b = a`.
* Objects can be assigned to variables, and an object is just a bit of data that has some sort of state -- sometimes called a value -- and associated behavior. Here's an example:

```ruby
>> greeting = 'Hello'
=> "Hello"
```

* This tells Ruby to associate the name `greeting` with the String object whose value is "Hello". In Ruby, `greeting` is said to _reference_ the String object. We can also talk of the variable as being _bound_ to the String object, or binding variable to the String object. Internally, the relationship looks like this:

![greeting-is-reference](/Users/matthewjohnston/Launch School/RB109 Assessment/greeting-is-reference.png)

* Here, the String object represented by the literal "Hello" is assigned to a variable that has the name `greeting`. This causes the variable `greeting` to reference the String object whose value is "Hello". It does so by storing the object id of the String.
* Reassignment to a variable dosn't change the object referenced by that variable; instead, the variable is bound to a completely new object -- made to reference a new object. The original object is merely disconnected from the variable.
* Objects can be either mutable or immutable. Mutable objects can be changed; immutable objects cannot be changed.
* In Ruby, numbers and boolean values are immutable. Once we create an immutable object, we cannot change it. There are no methods available that let you alter the value of any immutable object. All you can do is reassign the variable so it references a different object. This disconnects the original object from the variable, which makes it available for garbage collection unless another reference to the object exists elsewhere.
* Immutable objects aren't limited to numbers and booleans. Objects of some complex classes, such as `nil` (the only member of the NilClass class) and Range objects (e.g., `1..10`) are immutable. Any class can establish itself as immutable by simply not providing any methods that alter its state.
* Unlike numbers, booleans and a few other types, most objects in Ruby are mutable; they are objects of a class that permit modification of the object's state in some way. Whether modification is permitted by setter methods or by calling methods that perform more complex operations is unimportant; as long as you can modify an object, it is mutable.
* Ruby Array objects are mutable, allowing one to easily modify elements using indexed assignment.

![arrays-in-memory](/Users/matthewjohnston/Launch School/RB109 Assessment/arrays-in-memory.png)

* Above we can see that `a` is a reference to an Array, and, in this case, that Array contains three elements; each element is a reference to a String object.
* Strings and other collection classes are similar in the way they behave -- variables reference the collection (or String), and the collection contains references to the actual objects in the collection. Strings are a little bit different -- it's not really necessary to have separate objects for each character -- but they act in a similar way.
* Ruby variables are merely references to objects in memory; that is, a variable is merely a name for some object. Multiple variables can reference the same object, so modifying an object using a given name will be reflected in every other variable that is bound to that object. Also, assignment to a variable merely changes the binding; the object the variable originally referenced is not modified. Instead, a different object is bound to the variable.
* 



### Puts vs. Return

--------------

**Pages**

* Open Bookshelf: Intro to Programming -- The Basics: [puts vs return](https://launchschool.com/books/ruby/read/basics#putsvsreturn)
* Open Bookshelf: Intro to Programming -- Methods: [puts vs return: The Sequel](https://launchschool.com/books/ruby/read/methods#putsvsreturnthesequel)



**Highlights**

* When we call the `puts` method, we're telling Ruby to print something to the screen. However, `puts` does not return what is printed to the screen. Expressions **do** something, but they also **return** something. The value returned is not necessarily the action that was performed.
* Ruby methods ALWAYS return the evaluated result of the last line of the expression unless an explicit return comes before it.





### False, Nil, and "Truthiness"

-------------

**Pages**

* Lesson 2: Small Programs -- [Truthiness](https://launchschool.com/lessons/a0f3cd44/assignments/9984760e)
* Open Bookshelf: Intro to Programming -- The Basics: [nil](https://launchschool.com/books/ruby/read/basics#nil)



**Highlights**

* Usually, the notion of whether a value is "true" or "false" is captured in a **boolean** data type. A boolean is an object whose only purpose is to convey whether it is "true" or "false".
* In Ruby, booleans are represented by the `true` and `false` objects. Like everything else in Ruby, boolean objects also have real classes behind them, and you can call methods on `true` and `false`.
* Truthiness differs from `true` in that Ruby considers more than the `true` object to be "truthy". In fact, Ruby is a very liberal language and _considers everything to be truthy other than `false` and `nil`_.
* This means that we can use any expression in a conditional, or with logical operators, and as long as it doesn't evaluate to `false` or `nil`, it is considered true. Note that an expression that Ruby _considers true_ is not the same as the `true` object. This is what "truthiness" means.
* `nil`, on the other hand, is considered "falsy".
* Remember this rule: everything in Ruby is considered "truthy" except for `false` and `nil`.
* In programming, we need a way to express "nothing", and in Ruby, we do this through something called `nil`. A variable with a value of `nil` could be described as having 'nothing' or being 'completely empty', or even just simply 'not any specific type'. A situation where this may occur is where output is expected but none is returned.
* An important property of the nil type is that when used in an expression, such as an `if` statement, it will be treated as false, as it represents an absence of content.
* While both `false` and `nil` are treated as negative when evaluted in an expression, they are not equivalent. 





### Method Definition & Method Invocation

-----------

**Pages**

* Lesson 2: Small Programs -- [More Variable Scope](https://launchschool.com/lessons/a0f3cd44/assignments/9e9e907c)



**Highlights**

* **Method definition:** is when, within our code, we define a Ruby method using the `def` keyword. The `def...end` construction in Ruby is method definition. Method definition _sets_ a scope for local variables in terms of parameters and interaction with blocks.
* **Method invocation:** is when, we call a method, whether that happens to be an existing method from the Ruby Core API or core Library, or a custom method that we've defined ourselves using the `def` keyword. Referencing a method name, either of an existing method or subsequent to definition, is method invocation. Method invocation _uses_ the scope set by the method definition.
* A block is _part_ of the method invocation. In fact, _method invocation_ followed by curly braces or `do..end` is the way in which we _define_ a block in Ruby. Method invocation followed by `{...}` or `do...end` defines a block; the block is _part of_ the method invocation.
* Essentially the block acts as an argument to the method. In the same way that a local variable can be passed as an argument to a method at invocation, when a method is called with a block it acts as an argument to that method.
* The way that an argument is used, whether it is a method parameter or a block, depends on how the method is defined.
* Blocks and methods can interact with each other; the level of that interaction is set by the method definition and then used at method invocation.
* When invoking a method with a block, we aren't just limited to executing code within the block; depending on that method definition, the method can use the _return value_ of the block to perform some other action. Consider the following example:

```ruby
a = "hello"

[1, 2, 3].map { |num| a } # => ["hello", "hello", "hello"]
```

* The `Array#map` method is defined in such a way that it uses the return value of the block to perform transformation on each element in an array. In the above example, `#map` doesn't have direct access to `a` but it can use the value of `a` to perform transformation on the array since the block _can_ access `a` and returns it to `#map`. 
* Method definitions _cannot_ directly access local variables initialized outside of the method definition, nor can local variables initialized outisde of the method definition be reassigned from within it. A block _can_ access local variables initialized outside of the block and can reassign those variables. We already know that methods can access local variables passed in as arguments, and now we have seen that method can access local variables through interaction with blocks.
* Given this additional context, we can think of **method definition** as setting a certain scope for any local variables in terms of the parameters that the method definition has, what it does with those parameters, and also how it interacts (if at all) with a block. We can then think of **method invocation** as using the scope set by the method definition. If the method is defined to use a block, then the scope of the block can provide additional flexibility in terms of how the method invocation interacts with its surroundings.





### Implicit Return Value of Method Invocations and Blocks

--------

**Pages**

* 



**Highlights**

* 

