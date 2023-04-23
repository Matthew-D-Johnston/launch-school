ALPHA_HASH = {"A"=>1, "B"=>2, "C"=>3, "D"=>4, "E"=>5, "F"=>6,
              "G"=>7, "H"=>8, "I"=>9, "J"=>10, "K"=>11,
              "L"=>12, "M"=>13, "N"=>14, "O"=>15, "P"=>16,
              "Q"=>17, "R"=>18, "S"=>19, "T"=>20, "U"=>21,
              "V"=>22, "W"=>23, "X"=>24, "Y"=>25, "Z"=>26
            }

NUMBER_OF_LETTERS = 26

def multiply_ends_and_everything_in_between(array)
  beginning_factor = NUMBER_OF_LETTERS - ALPHA_HASH[array.first]
  ending_factor = NUMBER_OF_LETTERS - ALPHA_HASH[array.last]
  everything_in_between = NUMBER_OF_LETTERS**(array.size - 2)

  beginning_factor * ending_factor * everything_in_between
end

def add_value_of_each_char(array)
  new_array =[]
  array.each do |char|
    new_array << NUMBER_OF_LETTERS - ALPHA_HASH[char]
  end
  new_array.sum
end

def successive_multiplication(array)
  total = 0 
  1.upto(array.length - 3) do |idx|
    total += (26 - ALPHA_HASH[array[idx]]) * (26 - ALPHA_HASH[array[-1]]) * 26**(array[idx..-1].length - 2)
  end
  total += (26 - ALPHA_HASH[array[-2]]) * (26 - ALPHA_HASH[array[-1]])
end


def string_counter(string)
  string_chars = string.chars
  total_combinations = 0

  loop do
    if string_chars.size == 1
      total_combinations += NUMBER_OF_LETTERS - ALPHA_HASH[string_chars.first]
      break
    elsif string_chars.size == 2
      first_factor = NUMBER_OF_LETTERS - ALPHA_HASH[string_chars.first]
      second_factor = NUMBER_OF_LETTERS - ALPHA_HASH[string_chars.last]
      total_combinations += first_factor * second_factor
      break
    else
      total_combinations += multiply_ends_and_everything_in_between(string_chars)
      total_combinations += add_value_of_each_char(string_chars)
      total_combinations += successive_multiplication(string_chars)
      total_combinations += successive_multiplication(string_chars.reverse)
    end

    string_chars.shift
    string_chars.pop
    break if string_chars.size == 1
  end

  total_combinations
end

p string_counter('ABCD')
p string_counter('XYZA')
p string_counter('XYZ')
p string_counter('ZAZ')
p string_counter('ABC')
p string_counter('Z')
p string_counter('ABCDE')





