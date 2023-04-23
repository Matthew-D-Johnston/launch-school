# multliply_all_pairs.rb

# Write a method
# input: two arrays, each containg a list of numbers
# output: new array containing the product of every pair of numbers that can be
# formed between the elements of the two arrays. Results should be sorted by
# increasing value.

def multiply_all_pairs(list1, list2)
  results = []

  list1.each do |number1|
    list2.each do |number2|
      results << number1 * number2
    end
  end

  results.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
