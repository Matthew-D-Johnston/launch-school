# unlucky_days.rb

# write a method
# input: an integer representing the year ( year > 1752 )
# output: integer representing the number of Friday the 13ths in a given year

# Given a particular year, need to check for each month what day of the week
# 13th day of that month is.

# Need to first 
# count += if Time.new(2015, 01, 13).friday?
# count = 0
# 1.upto(12) do |month|
#     count += 1 if Time.new(year, month, 13).friday?
# end
# count

def friday_13th(year)
  fridays = 0
  1.upto(12) do |month|
    fridays += 1 if Time.new(year, month, 13).friday?
  end
  fridays
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
p friday_13th(1983) == 1

