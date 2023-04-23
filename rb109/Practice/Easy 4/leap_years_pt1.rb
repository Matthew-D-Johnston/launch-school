# leap_years_pt1.rb

# leap years:
# divisible by 4 unless divisible by 100 (if divisible by 4 and not divisible 100)

# not leap year:
# divisible by 100 unless divisible by 400 (if divisible by 100 and not divisible by 400)

def leap_year?(year)
  year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
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
