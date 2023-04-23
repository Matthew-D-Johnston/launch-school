# spin_me.rb
# You are given a method named `spin_me` that takes a string as an argument and
# returns a string that contains the same words, but with each word's
# characters reversed. Given the method's implementation, will the returned
# string be the same object as the one passed in as an argument or a different
# object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

puts spin_me("hello world")

# My response:
# The returned string will be a different object, since when we call `split` on
# the string we are creating a new Array object; thus, even though we use the
# destructive form of `reverse` (i.e. `reverse!`), this is being done to each 
# element of the array rather than the original String object. Thus, when we
# finally `join` the array back together to form a string, it is a new String
# object rather than the original.
