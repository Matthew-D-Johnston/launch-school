# after_midnight2.rb
# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range of `0..1439`.

# You may not use ruby's `Date` and `Time` methods.

# Pseudo-code:

# Data Structure:
# inputs: string representing the time of day in 24-hour format where the range
# is from '00:00' to '24:00', both of which represent midnight and therefore, 0
# minutes after midnight.
# outputs: 
# Method 1) an integer value indicating the number of minutes after midnight.
# Method 2) an integer value indicating the number of minutes before midnight.
# Both methods will have a return value within the range of 0..1439.
# rules: cannot use Ruby's `Date` and `Time` methods.

# Algorithm:
# Notice that the input is a string in the following format: 'hh:mm'; thus, we
# should first extract the 'hh' and 'mm' into separate components 'hours' and
# 'minutes' components and then convert to integer values:
# 1) separate the 'hh' and 'mm' with `split(':')`, which returns an array with
# two elements corresponding to our 'hh' and 'mm' components; call the array
# hh_mm_strings.
# 2) We can then convert the string elements of the array into integers using
# the `to_i` method, storing them under the variable name `hh_mm_integers`.
# 3) To find the total number of minutes we can do the following:
# `minutes` = `hh_mm_integers`[0] * MINUTES_PER_HOUR + `hh_mm_integers`[1]
# 4) this is where the two separate methods diverge:
# a) for the `after_midnight` method: we can merely output the total minutes
# to get the output
# b) for the `before_midnight` method: we will need to subtract the total
# minutes calculated from 1440.
# 5) Since the output must be within a range of 0..1439, we should check to
# make sure that restriction is met, and if not, print a message indicating
# that the input time is out of range or an invalid time input.


MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_input)
  hh_mm_array = time_input.split(':').map(&:to_i)
  minutes_after_midnight = hh_mm_array[0] * MINUTES_PER_HOUR + hh_mm_array[1]
  
  if minutes_after_midnight == MINUTES_PER_DAY
    0
  elsif minutes_after_midnight > MINUTES_PER_DAY
    "Invalid time input: time must be between '00:00' and '24:00'."
  else
    minutes_after_midnight
  end
end

def before_midnight(time_input)
  hh_mm_array = time_input.split(':').map(&:to_i)
  minutes_after_midnight = hh_mm_array[0] * MINUTES_PER_HOUR + hh_mm_array[1]
  minutes_before_midnight = MINUTES_PER_DAY - minutes_after_midnight

  if minutes_before_midnight == MINUTES_PER_DAY
    0
  elsif minutes_before_midnight < 0
    "Invalid time input: time must be between '00:00' and '24:00'."
  else
    minutes_before_midnight
  end
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
puts after_midnight('24:01') == "Invalid time input: time must be between '00:00' and '24:00'."
puts before_midnight('24:01') == "Invalid time input: time must be between '00:00' and '24:00'."

puts '-----'

# Launch School solution:



def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
puts after_midnight('24:01') == 1
puts before_midnight('24:01') == 1439


