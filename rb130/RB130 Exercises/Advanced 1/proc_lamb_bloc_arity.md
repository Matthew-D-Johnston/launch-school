#####  RB130 - Ruby Foundations: More Topics > Advanced 1

---

## Exploring Procs, Lambdas, and Blocks: Definition and Arity

For this exercise, we'll be learning and practicing our knowledge of the _arity_ of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a `Proc` and a `Lambda`, and the difference between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

---

#### Group 1  

```
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
```

* On the first line we are initializing the local variable `my_proc` and assigning it to a `Proc` object, which is initialized with the block `{ |thing| puts "This is a #{thing}" }`.  
* On the second line we call the `puts` method on the `my_proc` local variable, which outputs the following: `#<Proc:0x00007fdf5aa250d0@proc_lamb_block_arity.rb:4>`. It looks like some kind of identification number of the `Proc` object but it includes the file name in which that object was initialized; that file name is prepended with an `@` sign.
* On the third line we call the `class` method on the `my_proc` local variable, which returns the class name of the object referenced by `my_proc`; that object is of the `Proc` class. The `puts` method call prints `Proc` to the terminal screen.
* On the fourth line we call the `Proc#call` method on the `my_proc` local variable, which invokes the block associated with our `Proc` object. Since that block includes a `puts` method call, the message following the `puts` call is printed to the screen. Notice that we have not supplied an argument to be assigned to the `thing` parameter, so `thing` is referencing nil. The message thus output to the screen is `This is a .`.
* On the fifth line we call the `Proc#call` method again, but we suppy an argument, `'cat'`, to the method call. Now the `String` object 'cat' is assigned to the `thing` parameter and is used by the string interpolation method within the message on which `puts` is called. Thus, the following message is output: `This is a cat.`.

---

#### Group 2

```ruby
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
```

* On the first line we initialize the local variable `my_lambda` and we assign it to a `Proc` object, but a special type of `Proc` object called a `lambda`. We have supplied this `lambda` with a block, `{ |thing| puts "This is a #{thing}." }`.
* On the second line we initialize the local variable `my_second_lambda` and we assign it to another special `Proc` object, a `lambda`. However, the code is slightly different than that used on the first line; following the assignment operator, `=`, we have the following, `-> (thing) { puts "This is a #{thing}." }`.
* On the third line we call the `puts` method on `my_lambda`, which outputs the following to the screen: `#<Proc:0x00007fac8c9b1f78@proc_lamb_block_arity.rb:13 (lambda)>`. Again, this starts off with the name of the class (i.e. `Proc`) and then followed by some kind of coding, followed by the name of the file prepended by an `@` symbol, and then following that we have, `(lambda)`.
* On the fourth line we call the `puts` method on `my_second_lambda` and get a similar message as we did from our `puts` call on the third line: `#<Proc:0x00007fac8c9b2068@proc_lamb_block_arity.rb:14 (lambda)>`.
* On the fifth line we call the `class` method on `my_lambda`, which returns the class name of the object assigned to the `my_lambda`. The `puts` method call then prints that class name to the screen; in this case, `Proc`.
* On the sixth line we call the `Proc#call` method on `my_lambda` while passing in the `String` object argument `'dog'`. The `'dog'` argument is assigned to the `thing` parameter within the block that was orgininally included when we initialized the `Proc` object. The `puts` method call within the block prints the message, `This is a dog`.
* On the seventh line we call the `Proc#call` method again but without an argument. However, unlike when we called the `call` method without an argument on our `Proc` object in Group 1, this time when we call it on a `lambda` an `ArgumentError` exception is raised, indicating that we didn't suppy any arguments when `1` was expected.
* On the eighth line of code we initialize the local variable `my_third_lambda`. However, when we try to assign this variable a `NameError` exception is raised due to an `uninitialized constant Lambda`. Somehow, `Lambda` is not a recognized name in Ruby.

---

#### Group 3

```ruby
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }
block_method_1('seal')
```

* On the first three lines we define a new method that takes a single argument, `block_method1(animal)`.
* On the second line, the `yield` keywords means that our method yields to a block argument implemented by the user of the method.
* On the fifth line, we call our newly defined method and pass it the argument `'seal'`. A block is also included as an argument. That block argument is, `{ |seal| puts "This is a #{seal}." }`. However, because our yield method does not take any argument, nothing is assigned to the `seal` block-parameter, and thus that perimeter references `nil`. The `puts` method outputs the following to the screen: `This is a .`.
* On the sixth and final line, we call our newly defined method again, passing `'seal'` as an argument. But because we do not include a block argument, a `LocalJumpError` exception is raised.

---

#### Group 4

```ruby
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}." }
```

* On the first three lines we define a method with a single parameter and which yields to a block.
* On the fifth line we call our newly defined `block_method_2`, pass it `'turtle'` as an argument, and implement a block of code. The `'turtle'` argument is yielded to the block and assigned to the `turtle` parameter. The `puts` method prints the message `This is a turtle.`.
* On the sixth line we call the `block_method_2` again, passing the argument `'turtle'` and including a block argument. However, we've defined our block argument with a second parameter, `seal`, which we invoke through string interpolation on the next line of code. But since the `yield` method in our method definition only takes one argument, only one argument is passed to the block and assigned to the first parameter, `turtle`. Thus, the `seal` parameter references `nil` and our screen print out looks like this: `This is a turtle and a .`.
* On the nintth line we call our method and again passing it the argument `'turtle'`. However, this time when we include the block we do not include the block's parameters. We simply have a `puts` call on a message that includes string interpolation with an uninitialized local variable, `animal`. Consequently, the line raises a `NameError` exception, indicating, `undefined local variable or method 'animal'`.

---

#### Summary

From the above examples, it appears that Procs, lambdas, and blocks are very similar types of Ruby objects. However, let's point out some of the differences while also dicussing some of those similarities. Procs and lambdas both appear to allow us to assign a block to a local variable, while a block is just a piece of code that is implemented as an argument to a specific method call. Procs and lambdas allow us to store the block lines of code as a distinct object. The difference, however, between Procs and lambdas is that for blocks that take an argument, while we can invoke the `call` method on a Proc object without passing in any arguments, if we do this for a lambda, we will get an `ArgumentError`; if we don't pass an argument to the `call` method for a Proc object, the block parameter will reference `nil`, and the block will be executed without an `ArgumentError`. Also, it appears that lambdas are a special kind of Proc, as they are a part of the `Proc` class; there does not appear to be a separate class for lambdas.  

Blocks, on the other hand, can be used in conjunction with specific methods, essentially as additional arguments. We can define our own methods, and through the use of the `yield` keyword, we can allow for additional implementation to occur a the time the method is called. Similar to Procs, if we do not supply an argument to the block, our program will not raise an `ArgumentError`. However, if there is a `yield` method within the definition of the method and we do not include a block argument, then our program will raise a `LocalJumpError` exception, unless we qualify our call to the `yield` method with a conditional `if block_given?`. 

#### Launch School's Comparison  

* Lambdas are types of Proc's. Technically they are both `Proc` objects. An implicit block is a grouping of code, a type of closure, it is not an Object.  
* Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.

