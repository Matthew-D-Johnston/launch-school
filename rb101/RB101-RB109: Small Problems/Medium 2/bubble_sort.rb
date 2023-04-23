# bubble_sort.rb

beginning_time = Time.now

def bubble_sort!(array)
  counter = 0
  break_condition = counter

  loop do
    previous_elem = nil

    array.each_with_index do |current_elem, idx|
      if idx == 0 || previous_elem <= current_elem
        previous_elem = current_elem
      else
        array[idx - 1] = current_elem
        array[idx] = previous_elem
        counter += 1
      end
    end

    counter == break_condition ? break : break_condition = counter
  end
end

beginning_time = Time.now

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time) * 1000} milliseconds"

puts '------'

# Launch School Solution:

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

beginning_time = Time.now

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time) * 1000} milliseconds"

puts '------'

# Further Exploration

def bubble_sort!(array)
  counter = 0
  break_condition = counter
  idx_counter = array.size

  loop do
    previous_elem = nil

    array.each_with_index do |current_elem, idx|
      break if idx == idx_counter
      
      if idx == 0 || previous_elem <= current_elem
        previous_elem = current_elem
      else
        array[idx - 1] = current_elem
        array[idx] = previous_elem
        counter += 1
      end
    end

    idx_counter -= 1
    counter == break_condition ? break : break_condition = counter
  end
end

beginning_time = Time.now

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time) * 1000} milliseconds"
