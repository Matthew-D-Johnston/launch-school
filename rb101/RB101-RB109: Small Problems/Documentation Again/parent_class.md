Use irb to run the following code:

```ruby
s = 'abc'
puts s.public_methods.inspect
```

This prints out a list of all of the public methods available to the String `s`; this includes not only those methods defined in the `String` class, but also methods that are inherited from `Object` (which inherits other methods from the `BasicObject` class and the `Kernel` module). 

The mofied code that will print just the public methods that are defined or overridden by the `String` class is:

```ruby
puts s.public_methods(false).inspect
```

