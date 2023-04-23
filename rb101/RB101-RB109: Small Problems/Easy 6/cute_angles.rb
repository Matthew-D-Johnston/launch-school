# cute_angles.rb
# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes and seconds. You should use a degree symbol (°) to represent
# degrees, a single quote (') to represent minutes, and a double quote (") to
# represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# Note: your results may differ slightly depending on how you round values, but
# should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the
# minutes and seconds, e.g., `321°03'07"`.

# You may use the `DEGREE` constant defined by Launch School below.

# Pseudo-code:

# Data Structure:
# input: a floating point number that represents an angle between 0 and 360
# degrees.
# output: a string representation of the input in degrees, minutes, and
# seconds.
# rules: all minutes and seconds should be two digits with leading zeros if
# necessary

# Algorithm:
# In addition to Launch School's `DEGREE` constant, define a MINUTE and SECOND
# constant. Perhaps define some constants indicating how many minutes in a
# degree, and how many seconds in a minute.
# Begin by initializing the method definition: def dms(angle)
# 1) Need some way of separating the whole number part from the decimal part of
# the input:
# a) could use number.to_i, which would give me the whole number part, which I
# could then use to subtract from the original number to get the decimal
# portion
# 2) Once I have isolated the decimal part I can multiply that by my
# `MIN_IN_DEGREES` constant. Once again, I can convert to an integer and then
# subtract the integer from the result of the multiplication to get another
# decimal representation of the seconds.
# 3) repeat the above step for the seconds, multiply by `SEC_IN_MIN` constant
# and then converting to an integer.
# 4) Need to pad the minutes and seconds with leading 0s if < 10:
# ex. minutes = "0#{minutes}" if minutes < 10
# 5) finally, return "#{degrees}DEGREES#{minutes}'#{seconds}\"\"

DEGREE = "\xC2\xB0"
MIN_IN_DEGREES = 60
SEC_IN_MIN = 60

def dms(angle)
  degrees = angle.to_i

  degree_decimals = (angle - degrees).round(10)
  minutes_angle = degree_decimals * MIN_IN_DEGREES
  minutes = minutes_angle.to_i
  
  minute_decimals = (minutes_angle - minutes).round(10)
  seconds_angle = minute_decimals * SEC_IN_MIN
  seconds = seconds_angle.round
  if seconds == 60
    seconds = 0
    minutes += 1
  end

  if minutes == 60
    minutes = 0
    degrees += 1
  end

  minutes = "0#{minutes}" if minutes < 10
  seconds = "0#{seconds}" if seconds < 10
  "#{degrees % 360}#{DEGREE}#{minutes}'#{seconds}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(720)
puts dms(358.9899)

puts '-------'

# Launch School solution:

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  degrees %= 360
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(720)
puts dms(-420)

puts '-----'

# Further Exploration:
# Our solution returns the following results for inputs outside the range
# 0-360.
