LETTERS = {"A" => 26, "B" => 25, "C" => 24, "D" => 23, "E" => 22, "F" => 21,
              "G" => 20, "H" => 19, "I" => 18, "J" => 17, "K" => 16,
              "L" => 15, "M" => 14, "N" => 13, "O" => 12, "P" => 11,
              "Q" => 10, "R" => 9, "S" => 8, "T" => 7, "U" => 6,
              "V" => 5, "W" => 4, "X" => 3, "Y" => 2, "Z" => 1
            }

TOTAL_LETTERS = 26


# letter_value_array = string.chars.map { |char| LETTERS[char] }

def letter_value_conversion(array)
  new_array = []
  last_idx = array.size - 1

  array.each_with_index do |value, idx|
    if idx == 0 || idx == last_idx
      new_array << value - 1
    else
      new_array << TOTAL_LETTERS
    end
  end

  new_array
end

def string_counter(string)
  letter_values = string.chars.map { |char| LETTERS[char] }
  total_combinations = 0
  last_idx = letter_values.size - 1


  loop do 
    0.upto(last_idx) do |idx|
      array_range = letter_values[idx..last_idx]
      total_combinations += letter_value_conversion(array_range).reduce(:*)
    end

    1.upto(last_idx) do |idx|
      array_range = letter_values.reverse[idx..last_idx]
      total_combinations += letter_value_conversion(array_range).reduce(:*)
    end

    break if letter_values.size <= 2
    letter_values.shift
    letter_values.pop
    last_idx = letter_values.size - 1
  end


  total_combinations % ((10**9)+7)
end

p string_counter('XYZ') == 5
p string_counter('ABC') == 16174
p string_counter('ABCD') == 402230
p string_counter('ZAZ') == 25
p string_counter('XYZA') == 34480
p string_counter('ABCDE') == 9983375
p string_counter('ABDEFGHIJKLMNOPQRSTUDAFDAJAADFAMVURADFADGGFHFRTDRDSSEXDDFGGHJJNHGFDSESEEDGHBFDWERTBCDERJKKNFLSFGJCXNSUWDGFLVADFGFKKMJDUSGKBLMEYUYOIPDSXSFARWEFJDFJRNFDGJFUHGJDVWXYZCFANEADIGASOFIAEOGNSKDAGADFAKDGSDEGADFADGASDIEADFAADFSDGCCSDESGASGAKDSGADGNADSFDASFKGNAGDS')