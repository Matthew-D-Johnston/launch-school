# multiplicative_average.rb

def show_multiplicative_average(numbers)
  average = (numbers.reduce(:*).to_f / numbers.size).round(3)
  "The result is #{format("%0.3f", average)}"
end

p show_multiplicative_average([3, 5])
p show_multiplicative_average([6])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])
