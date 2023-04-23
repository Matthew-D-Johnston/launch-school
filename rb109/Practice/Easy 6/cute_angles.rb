# cute_angles.rb

# write a method
# input: a floating point number represengint angle between 0 and 360 degrees
# output: a string representation representing that angle in degrees, minutes,
# and seconds

# degree = 60 minutes
# minute = 60 seconds
# fullrotation = 360 degrees = 0 degrees

DEGREE = "\xC2\xB0"

MIN_PER_DEGREE = 60
SEC_PER_MINUTE = 60

def dms(angle_degrees)
  degrees = angle_degrees.to_i
  decimal_degrees = angle_degrees - degrees

  angle_minutes = MIN_PER_DEGREE * decimal_degrees
  minutes = angle_minutes.to_i
  decimal_minutes = angle_minutes - minutes

  angle_seconds = SEC_PER_MINUTE * decimal_minutes
  seconds = angle_seconds.round

  if minutes == 60
    minutes = 0
    degrees += 1
  end

  if seconds == 60
    seconds = 0
    minutes += 1
  end
  
  "#{degrees}#{DEGREE}#{format("%02d", minutes)}'#{format("%02d", seconds)}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
