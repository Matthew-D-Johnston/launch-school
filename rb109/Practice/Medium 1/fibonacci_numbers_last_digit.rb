# fibonacci_numbers_last_digit.rb

# 1, 1, 2, 3, 5, 8, 13,...
# 1, 2, 3, 4, 5, 6, 7,...


def fibonacci_last(nth)
  scaled_fib_number = nth % 60
  return 0 if scaled_fib_number == 0
  return 1 if scaled_fib_number <= 2

  f1 = 1
  f2 = 1
  fib = 0

  (scaled_fib_number - 2).times do
    fib = f2 + f1
    f1 = f2
    f2 = fib
  end

  fib.to_s[-1].to_i
end

p fibonacci_last(15) == 0
p fibonacci_last(20) == 5
p fibonacci_last(100) == 5
p fibonacci_last(100_001) == 1
p fibonacci_last(1_000_007) == 3
p fibonacci_last(123456789) == 4

