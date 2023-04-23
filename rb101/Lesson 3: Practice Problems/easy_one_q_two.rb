# easy_one_q_two.rb

# 1. The non-equivalence operator `!=` examples:

puts 5 != 4  # => `true`
puts 5 != 5  # => `false`
puts 'h' != 's' # => `true`
puts '------'

# 2. The negation operator `!` when prepending Ruby objects examples:
puts !false    # => `true`
puts !true     # => `false`
puts !nil      # => `true`
puts !5        # => `false`
puts !'hi'     # => `false`
puts '------'

# 3. The bang operator `!` when appending method calls examples:
words = ['hello', 'world', 'how', 'are', 'you', 'today', 'world']
puts 1
puts words
puts '-----'
puts 2
puts words.uniq       # returns all elements except for the last 'world'
puts '-----'
puts 3
puts words            # `words` remains unmodified
puts '-----'
puts 4
puts words.uniq!      # returns all elements except for the last 'world'
puts '-----'
puts 5
puts words            # `words` has been permanently modified
puts '-----'

# 4. When `?` prepends a single character it returns a `String` version of that
# character:

puts ?5     # => "5"
puts ?j     # => "j"
puts '-----'

# 5. `?` appends certain method calls, returning a boolean. It also
# follows the initial condition to be evaluated in the 'ternary operator'

puts words.include?('world')   # => true
puts 5 > 6 ? 'that would be interesting' : 'of course not' # => 'of course not'
puts '----'

# 6. `!!` is the double-negation operator, returning a boolean.

puts !!true        # => true
puts !!false       # => false
puts !!nil         # => false
user_name = "Matt"
puts !!user_name   # => true
puts '----'

