# sum_of_sums.rb

# write a method
# input: an array of numbers
# output: an integer, which is the sum of the sums of each leading subsequence
# for that array.

def sum_of_sums(numbers)
  sums = 0
  idx = 0

  numbers.length.downto(1) do |multiplier|
    sums += numbers[idx] * multiplier
    idx += 1
  end

  sums
end

p sum_of_sums([3, 5, 2]) == 21
p sum_of_sums([1, 5, 7, 3]) == 36
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

