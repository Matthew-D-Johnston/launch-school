# delete_vowels.rb

# iterate over array

def remove_vowels(arr_of_strings)
  arr_of_strings.map do |string|
    string.gsub(/[aeiou]/i, '')
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
