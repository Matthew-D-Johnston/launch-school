# grade_book.rb

# write a method
# input: three separate scores
# output: the letter value associated with the mean of those three scores

def get_grades(grade1, grade2, grade3)
  mean_grade = (grade1 + grade2 + grade3).to_f / 3

  if (90..100).include?(mean_grade)
    'A'
  elsif (80...90).include?(mean_grade)
    'B'
  elsif (70...80).include?(mean_grade)
    'C'
  elsif (60...70).include?(mean_grade)
    'D'
  else
    'F'
  end
end

puts get_grades(95, 90, 93) == 'A'
puts get_grades(50, 50, 95) == 'D'
