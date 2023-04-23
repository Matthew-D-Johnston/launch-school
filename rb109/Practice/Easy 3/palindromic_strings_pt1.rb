# palindromic_strings_pt1.rb

def palindrome?(string)
  string == string.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          
puts palindrome?("madam i'm adam") == false
puts palindrome?('356653') == true

puts '------'

def palindrome?(string)
  idx = string.length - 1
  reverse_string = ''

  while idx >= 0
    reverse_string += string[idx]
    idx -= 1
  end

  string == reverse_string
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          
puts palindrome?("madam i'm adam") == false
puts palindrome?('356653') == true
