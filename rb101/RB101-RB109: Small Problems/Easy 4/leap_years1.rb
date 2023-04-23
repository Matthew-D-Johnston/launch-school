# leap_years1.rb
# In the modern era under the Gregorian Calendar, leap years occur in every
# year that is evenly divisible by 4, unless the year is also divisble by 100.
# If the year is evenly divisible by 100, then it is not a leap year unless the
# year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method
# that takes any year greater than 0 as input, and returns true if the year is
# a leap year, or false if it is not a leap year.

def leap_year?(year)
  if (year % 4 == 0) && (year % 100 != 0)   # Divisible by 4 and 
    true                                    # not divisble by 100.
  elsif (year % 100 == 0) && (year % 400 == 0)  # Divisible by 100 and
    true                                        # divisible by 400.
  else      # for all other cases
    false
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

puts '-----'

# Launch School Solution:

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 00
    false
  else
    year % 4 == 0
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

puts '----'

# ...or...

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

puts '----'

# Further Exploration:

# The order in which you perform tests for a leap year calculation is
# important. For what years will `leap_year?` fail if you rewrite it as:

def leap_year?(year)
  if year % 100 == 0
    false             # will fail for years that are also divisible by 400.
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

# To rewrite this solution in the opposite order starting with the test for
# divisibility by four will essentially be comparable to my solution, which is
# more complex than Launch School's solution.

