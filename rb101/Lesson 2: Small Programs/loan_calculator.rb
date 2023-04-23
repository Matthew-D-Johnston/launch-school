# loan_calculator.rb

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.chop! if input.split('').last == '.'        # EC: ends with '.'
  input = input.insert(-1, '0') if input[-2] == '.' # EC: ends '.X' not '.X0'
  input.to_i.to_s == input
end

def float?(input)
  input.chop! if input.split('').last == '.'        # EC: ends with '.'
  input = input.insert(-1, '0') if input[-2] == '.' # EC: ends '.X' not '.X0'
  format('%.2f', input.to_f) == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

prompt('Welcome to the Mortgage / Car Loan Calculator.')

loop do # main loop
  loan = ''
  loop do # sub-loop 1 (loan)
    prompt('Please enter the loan amount:')
    loan = gets.chomp.tr_s(',', '') # `tr_s` method replaces ',' with ''
    if valid_number?(loan)
      loan = loan.to_f.round
      break
    else
      prompt('Invalid Input: make sure to enter a positive number.')
    end
  end

  apr = ''
  loop do # sub-loop 2: (apr)
    prompt('Please enter the annual percentage interest rate (APR):')
    apr = gets.chomp.tr_s(',', '') # `tr_s` method replaces ',' with ''

    if valid_number?(apr)
      apr = apr.to_f.round(2)
      break
    else
      prompt('Invalid Input: make sure to enter a positive number.')
    end
  end

  duration_y = ''
  loop do # sub-loop 3: (duration_y)
    prompt('Please enter the loan duration in number of years ' \
           '(fractions of a year will be rounded to nearest full year):')
    duration_y = gets.chomp.tr_s(',', '') # `tr_s` method replaces ',' with ''

    if valid_number?(duration_y)
      duration_y = duration_y.to_f.round
      break
    else
      prompt('Invalid Input: make sure to enter a positive number.')
    end
  end

  # intermediate calculations
  mpr = ((apr / 100) / 12).round(10)
  duration_m = duration_y * 12

  # final calculations
  m = loan * (mpr / (1 - (1 + mpr)**-duration_m))
  m = format('%.2f', m) # ensures `m` is stored to two decimal places.
  m = m.to_s

  counter = 7
  while m.length >= counter       # while loop ensures commas separate every
    m = m.insert(-counter, ',')   # three digits.
    counter += 4
  end

  # result
  puts "Your monthly loan payment is $#{m}"

  # final message
  prompt('Would you like to do another loan calculation? (Y or N)')
  response = gets.chomp

  break if response.downcase == 'n'
end

prompt'Thank you for using the Mortgage / Car Loan Calculator. Good bye!'
