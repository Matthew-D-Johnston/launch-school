# stringy_strings.rb

def stringy(int)
  digit_string = ''

  1.upto(int) do |num|
    digit_string << '1' if num.odd?
    digit_string << '0' if num.even?
  end

  digit_string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
