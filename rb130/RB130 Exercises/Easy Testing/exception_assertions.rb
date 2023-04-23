# exception_assertions.rb

# Write a minitest assertion that will fail unless `employe.hire` raises a
# `NoExperienceError` exception.

assert_raises NoExperienceError { employee.hire }

# or

assert_raises NoExperienceError do
  employee.hire
end