# sum_or_product_of_consecutive_integers.rb

puts ">> Please enter an integer greater than 0:"
int = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
computation_choice = gets.chomp

case computation_choice
when 's' 
  sum = (1..int).to_a.reduce(:+)
  puts "The sum of the integers between 1 and #{int} is #{sum}."
when 'p'
  product = (1..int).to_a.reduce(:*)
  puts "The product of the integers between 1 and #{int} is #{product}."
end
