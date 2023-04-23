# easy_two_q_one.rb

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

puts ages.include?("Spot")   # => false

# Bonus: What are two other hash methods that would work just as well for this
# solution?

puts ages.key?("Spot")       # => false
puts ages.has_key?("Spot")   # => false



