# sequence_generator.rb

def step(range_start, range_end, step_value)
  iterations = (range_end / step_value) + 1
  value = range_start
  
  iterations.times do 
    yield(value) unless value > range_end
    value += step_value
  end
  
  (range_start..range_end)
end


step(1, 12, 4) { |value| puts "value = #{value}" }

puts "----"

# Launch School's Solution:

def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end

step(1, 12, 4) { |value| puts "value = #{value}" }