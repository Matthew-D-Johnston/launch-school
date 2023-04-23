# what_century.rb
# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# `st`, `nd`, `rd`, or `th` as appropriate for that number.

# New centuries begin in years that end with `01`. So, the years 1901-2000
# comprise the 20th century.

# Pseudo-code:
# Some year, beginning at 1 and going to infinite, is given as an input.
# Each increment of one is a new century.
# So, begin with the first 100 years (1 - 100) and create a loop that checks to
# see if the given year is within that range and if not, then range jumps up by
# a hundred years.
# Once the correct range is found...

def century(year)
  century_start = 1
  century_finish = 100
  century_counter = 1
  
  loop do
    break if (century_start..century_finish).include?(year)
      
    century_start += 100
    century_finish += 100
    century_counter += 1
  end

  if century_counter.to_s[-2] == '1'
    "#{century_counter}th"
  else
    case century_counter.to_s[-1]
    when '1'
      "#{century_counter}st"
    when '2'
      "#{century_counter}nd"
    when '3'
      "#{century_counter}rd"
    else
      "#{century_counter}th"
    end
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

puts '------'

# Launch School's Solution:

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'


