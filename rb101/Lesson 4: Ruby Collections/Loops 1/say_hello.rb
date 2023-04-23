# say_hello.rb
# Modify the code below so `"Hello!"` is printed 5 times.

say_hello = true
counter = 1         # my addition

while say_hello
  puts 'Hello!'
  counter += 1      # my addition
  say_hello = false if counter > 5  # my addition
end
