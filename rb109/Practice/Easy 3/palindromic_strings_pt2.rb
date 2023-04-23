# palilndromic_strings_pt2.rb

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  lowercased = string.downcase
  alpha_num_chars = lowercased.chars.select { |char| char.match?(/[a-z0-9]/) } 
  alphanumeric_string = alpha_num_chars.join
  palindrome?(alphanumeric_string)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
