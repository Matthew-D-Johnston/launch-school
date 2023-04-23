# medium_one_q_four.rb

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

original_array = [1, 2, 3, 4]
p original_array
puts '-------'
rolling_buffer1(original_array, 10, 5)
p original_array
puts '-------'
original_array = [1, 2, 3, 4]
p original_array
puts '-------'
rolling_buffer2(original_array, 10, 5)
p original_array
puts '-------'

