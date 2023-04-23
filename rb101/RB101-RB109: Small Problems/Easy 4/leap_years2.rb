# leap_years2.rb

# A continuation of the previous exercise.

# The British Empire adopted the Gregorian Calendar in 1752, which was a leap
# year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
# leap years occur in any year that is evenly divisble by 4.

# Using this information, update the method from the previous exercise to
# determine leap years both before and after 1752.

# Pseudo-code:
# Two main cases: years >= 1751 and years < 1752
# For years < 1752: leaps year occur in years evenly divisble by 4, or
# year % 4 == 0
# For years >= 1752: leap years occur in years that are evenly divisble by 4 
# so long as they are not also divisible by 100, and if they are divisble by
# 100 they are only a leap year if divisble by 400. That is, (years % 4 == 0 &&
# years % 100 != 0) || (years % 400 == 0).
# All other years that don't fit into any of these categories are not leap
# years.

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
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
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true

puts '-----'

# Launch School solution:

def leap_year?(year)
  if year < 1752 && year % 4 == 0
    true
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
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
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true

