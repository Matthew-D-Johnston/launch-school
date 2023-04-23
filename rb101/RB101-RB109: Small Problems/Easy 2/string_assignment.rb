# string_assignment.rb
# Take a look at the following code:
name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.
# Response:
# => Alice
# => Bob

# Correct!!

# Now, let's look at something a bit different:
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain the results?
# Response:
# => BOB
# => BOB
# Explanation:
# The `upcase!` method permanently mutates the object referenced by both `name`
# and `save_name`. Thus, even though the method was only called on the `name`
# variable, because it mutate the object and changed the value associated with
# that object, the `save_name` variable will also print out 'BOB'.

