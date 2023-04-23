# lettercase_counter.rb

# Write a method
# input: takes a string
# output: returns a hash containing three entries: 1) number of characters in
# string that are lowercase; 2) number of characters in string that are
# uppercase; and 3) number of characters in string that are neither.


# need condition for testing whether we have uppercase letter

def letter_case_count(string)
  cases = { lowercase: 0, uppercase: 0, neither: 0 }

  string.each_char do |char|
    if char.match?(/[a-z]/)
      cases[:lowercase] += 1
    elsif char.match?(/[A-Z]/)
      cases[:uppercase] += 1
    else
      cases[:neither] += 1
    end
  end

  cases
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
