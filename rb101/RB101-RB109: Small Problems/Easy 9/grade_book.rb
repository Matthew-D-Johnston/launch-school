# grade_book.rb
# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.

# Tested values are all between 0 and 100. There is no need to check for
# negative values or values greater than 100.

# Pseudo-code:

# Data Structure:
# input: three grade scores (numbers)
# output: a string: the lettter equivalent of the mean of the three scores
# rules
# 1) test values are between 0 and 100; no need to check for negative values
# or values greater than 100.

# Algorithm:
# 1) define a hash with the letter grade as keys and their range as values
# 2) initialize the method definition: def get_grade(grade1, grade2, grade3)
# 3) find the mean of the grades as floats:
#    mean_grade = (grade1.to_f + grade2.to_f + grade3.to_f) / 3
# 4) round the mean grade, making sure to always round down to the nearest one
#    digit to keep within the upper limit of each range (ex. 89.9 should round
#    to 89, or 'B', instead of 90, or 'A'): mean_grade.round(-1)
# 5) check to see which values include the rounded mean grade, and return the
#    appropriate key:
#    hash.select { |k, v| k if v.include?(mean_grade.round(-1))}[0]
# 6) return the selected key.

NUM_TO_LETTER_GRADE = { 'A' => (90..100),
                        'B' => (80...90),
                        'C' => (70...80),
                        'D' => (60...70),
                        'F' => (0...60) }

def get_grade(grade1, grade2, grade3)
  mean_grade = (grade1.to_f + grade2.to_f + grade3.to_f) / 3
  grade_hsh = NUM_TO_LETTER_GRADE.select do |letter, range|
    letter if range.include?(mean_grade)
  end
  grade_hsh.keys[0]
end

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'

puts '------'

def get_grade(grade1, grade2, grade3)
  mean_grade = (grade1.to_f + grade2.to_f + grade3.to_f) / 3
  if (90..100).cover?(mean_grade)
    'A'
  elsif (80...90).cover?(mean_grade)
    'B'
  elsif (70...80).cover?(mean_grade)
    'C'
  elsif (60...70).cover?(mean_grade)
    'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'

puts '-------'

# Launch School solution:

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else             'F'
  end
end

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'
