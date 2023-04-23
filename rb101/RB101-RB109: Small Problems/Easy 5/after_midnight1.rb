# after_midnight1.rb
# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using thsi minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any
# integer input.

# You may not use ruby's `Date` and `Time` classes.

# Pseudo-code:

# Data Structure:
# input: an integer representing the number of minutes before or after
# midnight; note that there are 60*24 = 1440 minutes in a day, but note that
# the method should work with any integer input, even greater than 1440 or less
# than -1440.
# output: a string representation of the time in 24 hour format (hh:mm).
# rules:
# a 0 input represents midnight and thus corresponds to a "00:00" output;
# negative integer inputs should be interpreted as minutes before midnight,
# and positive integer inputs as minutes after midnight;
# cannot use ruby's `Date` and `Time` classes.

# Algorithm:
# 1) Need to be able to take minute inputs and separate it into hours and
# minutes: the modulo operator could work here (i.e. minutes % 60, where the
# remainder equals the number of minutes), or even better, the divmod operator
# which will output both the result of division and the remainder (i.e. hours
# and minutes).
# 2) Then need some way to deal with hours longer than 24 hours: might be able
# to handle this with the modulo operator taking just the remainder as the
# number of hours past midnight since showing how many days past the initial
# starting midnight is not necessary.
# 3) Need to deal with ensuring that all 0s show up as needed: that means that
# for hours < 10, will need to insert a zero in front; for 0 minutes, will need
# to add a 0 on the end.

def time_of_day(minutes_input)
  hours, minutes = minutes_input.divmod(60)
  hours %= 24

  minutes = "0#{minutes}" if minutes < 10
  hours = "0#{hours}" if hours < 10
  "#{hours}:#{minutes}"
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

puts '-----'

# Launch School solution:

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

puts '-----'

# Further Exploration:
# How would you approach this problem if you were allowed to use ruby's `Date`
# and `Time` classes? Suppose you also needed to consider the day of week?
# (Assume that `delta_minutes` is the number of minutes before or after
# midnight between Saturday and Sunday; in such a method, a delta_minutes value
# of - 4231 would need to produce a return value of `Thursday 01:29`.)

# Pseudo-code
# input: integer representing number of minutes before (-) or after (+),
# midnight with 0 representing midnight between Saturday and Sunday.
# output: a string representation indicating the day of the week and a 24-hour
# time representation of the number of minutes before or after midnight.
# rules:
# able to use ruby's `Date` and `Time` classes.
# we shall use midnight to represent the start of a new day; thus, "00:00"
# should be prefixed by Sunday

# Algorithm:
# 1) Will first want to get rid of any redundant minutes; that is, given that
# there are 1440(min)*7(days) = 10,080 minutes in a week, any given integer
# that is either greater than 10,080 or less than -10,080 we only want the
# number of minutes beyond that limit: we can first define a constant named
# MINUTES_PER_WEEK = MINUTES_PER_DAY * 7, and then within our method we can
# use the modulo (%) operator to obtain the non-redundant minutes.
# 2)

MINUTES_PER_WEEK = MINUTES_PER_DAY * 7
DAYS_OF_WEEK = { 0 => 'Sunday', 1 => 'Monday', 2 => 'Tuesday',
                 3 => 'Wednesday', 4 => 'Thursday', 5 => 'Friday',
                 6 => 'Saturday' }

def time_of_day(minutes_input)
  delta_minutes = minutes_input % MINUTES_PER_WEEK

  days, minutes = delta_minutes.divmod(MINUTES_PER_DAY)
  hours, minutes = minutes.divmod(MINUTES_PER_HOUR)

  "#{DAYS_OF_WEEK[days]} #{format('%02d:%02d', hours, minutes)}"
end

puts time_of_day(0)
puts time_of_day(-3)
puts time_of_day(35)
puts time_of_day(-1437)
puts time_of_day(3000)
puts time_of_day(800)
puts time_of_day(-4231)
puts time_of_day(10081)
puts time_of_day(-10081)


