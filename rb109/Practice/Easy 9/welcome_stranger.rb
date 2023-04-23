# welcome_stranger.rb

# write a method
# input: two arguments: an array and a hash
# array: contains 2+ elements that, combined with adjoining spaces, will
# produce a person's name;
# hash: contains two keys, :title and :occupation, and the appropriate values

# output: a string greeting that uses the person's full name, and mentions
# the person's title

def greetings(array, hash)
  puts "Hello, #{array.join(' ')}! Nice to have a #{hash[:title]} " \
       "#{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

