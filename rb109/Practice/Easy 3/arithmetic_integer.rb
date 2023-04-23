# arithmetic_integer.rb

def prompt(msg)
  puts "==> #{msg}"
end

prompt("Enter the first number:")
num_one = gets.chomp.to_i

prompt("Enter the second number:")
num_two = gets.chomp.to_i

calcs = { '+' => num_one + num_two,
          '-' => num_one - num_two,
          '*' => num_one * num_two,
          '/' => num_one / num_two,
          '%' => num_one % num_two,
          '**' => num_one ** num_two
        }

count = 0
until count > calcs.size
  prompt("#{num_one} #{calcs.keys[count]} #{num_two} = #{calcs.values[count]}")
  count += 1
end
