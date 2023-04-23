# after_midnight_pt2.rb

# two methods
# each takes the time of day in 24 hours format as an input
# before midnight method will output number of minutes before midnight
# after midnight method will output number of minutes after midnight

# after midnight:
# 12:34 - 00:00 = 754
# take input and split along the ':' colon;
# convert to integers, first element will be in hours, and second in minutes
# convert hours to minutes
# add the the two elements together and voila

# before midnight:
# 00:00 - 12:34 = 686

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY


def after_midnight(hr_min)
  hr_min_arr = hr_min.split(':').map { |elem| elem.to_i }
  total_minutes = hr_min_arr.first * 60 + hr_min_arr.last
  total_minutes == 1440 ? 0 : total_minutes
end

def before_midnight(hr_min)
  return 0 if after_midnight(hr_min) == 0
  MINUTES_PER_DAY - after_midnight(hr_min)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
