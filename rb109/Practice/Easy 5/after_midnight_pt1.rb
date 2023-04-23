# after_midnight_pt1.rb

# 0 => midnight
# -time => before midnight
# +time => after midnight

# write a method
# takes time in minutes as input
# outputs the time of day in 24 hour format (hh:mm)

# 60 minutes per hour
# 24 * 60 = 1440 minutes/day
# -1440 and +1440 are my outer limits
# (minutes input % 1440)
# hours, minutes = number.divmod(60)
# "#{format('%0.2d', hours}:#{format('%0.2d', minutes}"

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def time_of_day(number)
  scaled_minutes = number % MINUTES_PER_DAY
  hours, minutes = scaled_minutes.divmod(MINUTES_PER_HOUR)
  "#{format('%02d', hours)}:#{format('%02d', minutes)}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
