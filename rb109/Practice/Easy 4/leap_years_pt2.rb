# leap_years_pt2.rb

def leap_year?(yr)
  (yr < 1752) ? (yr % 4 == 0) : (yr % 100 == 0 ? yr % 400 == 0 : yr % 4 == 0)
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
