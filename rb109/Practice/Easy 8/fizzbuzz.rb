# fizzbuzz.rb

# write a method:
# input: two arguments: a starting number, an ending number
# output: string of all numbers between the two numbers, except:
# 1) if a number is divisible by 3, print "Fizz"
# 2) if a number is divisible by 5, print "Buzz"
# 3) if a number is divisible by 3 and 5, print "FizzBuzz"

def fizzbuzz(start_num, end_num)
  final_output = ''

  start_num.upto(end_num) do |number|
    if number % 3 == 0 && number % 5 == 0
      final_output << ' FizzBuzz,'
    elsif number % 3 == 0
      final_output << ' Fizz,'
    elsif number % 5 == 0
      final_output << ' Buzz,'
    else
      final_output << ' ' + number.to_s + ','
    end
  end

  puts final_output[1..-2]
end

fizzbuzz(1, 15)
puts '------'
fizzbuzz(1,10)
puts '------'
fizzbuzz(3, 31)
