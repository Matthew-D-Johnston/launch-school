# alphabetical_numbers.rb

def alphabetic_number_sort(range_array)
  alpha_numbers = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  results = []
  selected_alpha_numbers = range_array.map { |num| alpha_numbers[num] }

  range_array.each_with_index do |num, idx|
    results << [selected_alpha_numbers[idx], num]
  end
  
  results.sort.map { |combo| combo[1] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
p alphabetic_number_sort((7..11).to_a)