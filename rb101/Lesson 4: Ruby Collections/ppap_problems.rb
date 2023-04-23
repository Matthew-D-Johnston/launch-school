# ppap_problem01.rb

# Practice Problem 1:

# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

# Pseudo-code:

# Data Structure:
# input: array of strings representing names of flintstone characters
# output: hash where names are keys and their position in the array is the
# value.

# Algorithm:
# Define a new hash variable: flintstones_hash = {}
# Or use the `each_with_object` method:
# flintstones.each_with_object({}) do |name, hash|
# No, perhaps first definint a new hash object and then using `each_with_index`
# is best.

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

puts flintstones_hash
puts '------'

# Practice Problem 2:

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

# My response:

sum_of_ages = 0
ages.each do |key, value|
  sum_of_ages += value
end

puts sum_of_ages
puts '------'


# Practice Problem 3:

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

ages.delete_if { |_, age| age >= 100 }

puts ages
puts '------'

# Practice Problem 4:

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

puts ages.values.sort.first
puts '------'

# Practice Problem 5:

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

be_name = ''
flintstones.each_with_index do |name, index|
  be_name = index if name[0] == 'B' && name[1] == 'e'
end

puts be_name
puts '------'

# ...or...

be_name = flintstones.bsearch_index do |name|
  name[0] == 'B' && name[1] == 'e'
end

puts be_name

puts '------'

# Practice Problem 6:
# Amend this array so that the names are all shortened to just the first three
# characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map { |name| name[0, 3] }
p flintstones
puts '------'

# ...or, to mutate the original array...

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.each { |name| name.slice!(3..-1) }
p flintstones
puts '------'

# Practice Problem 7:
# Create a hash that expresses the frequency with which each letter occurs in
# this string:

statement = "The Flintstones Rock"

letter_frequency = Hash.new(0)
statement.split('').each do |letter|
  letter_frequency[letter] += 1 unless letter == ' '
end

p letter_frequency
puts '-----'

# Launch School response:

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_freq = statement.scan(letter).count
  result[letter] = letter_freq if letter_freq > 0
end

puts letter_frequency == result
puts '------'

# Practice Problem 8:

# see practice_additional_practice.md

# Practice Problem 9:

# Write your own `titleize` method that takes a string and capitalizes the
# first letter of each word in the string.

def titleize(string)
  capitalized = []
  string.split.each { |word| capitalized << word.capitalize }
  capitalized.join(' ')
end

p titleize("the flintstones rock")
puts '-----'

# Practice Problem 10:

# Given the following hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the
# family member is in (kid, adult, or senior). 

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and
# a senior is aged 65+.

munsters.values.map do |inner_hash|
  if (0..17).include?(inner_hash["age"])
    inner_hash["age_group"] = "kid"
  elsif (18..64).include?(inner_hash["age"])
    inner_hash["age_group"] = "adult"
  else
    inner_hash["age_group"] = "senior"
  end
end

puts munsters == { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => { "age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
