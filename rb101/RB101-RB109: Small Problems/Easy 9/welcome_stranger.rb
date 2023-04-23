# welcome_stranger.rb
# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, `:title` and
# `:occupation`, and the appropriate values. Your method should return a
# greeting that uses the person's full name, and mentions the person's title.

# Pseudo-code:
# input: 2 arguments: an array and a hash; the array contains 2 or more
# elements that, when combined with adjoining spaces, will produce a person's
# name; the hash, will contain two keys, `:title` and `:occupation`, and the
# approprite values.
# output: a string representation of a greeting that uses the person's full
# name, and mentions the person's title.

# Algorithm:
# 1) initialize the method definition: def greetings(array, hash)

def greetings(name_array, title_hash)
  puts "Hello, #{name_array.join(' ')}! Nice to have a " \
       "#{title_hash[:title]} #{title_hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# Launch School solution:
# similar to mine
