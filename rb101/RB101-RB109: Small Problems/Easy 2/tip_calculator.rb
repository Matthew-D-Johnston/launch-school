# tip_calculator.rb
# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display bot the tip
# and the total amount of the bill.

# Pseudo-code:
# Create a loop that begins by asking the user for the bill amount.
# Take the user's input and check to see if it is a valid positive integer.
# If it is not, then print out a message that indicates an invalid input, and
# loop back to the ask for the bill amount again.
# Create a similar loop that begins by asking for the tip amount.
# Again, validate the input and loop back to ask the question again if the
# input is invalid.
# Once valid inputs are received, calculate the total tip amount, and what the
# the total bill amount is.
# Then print out the results with a message telling the user the totals.

# Formal pseudo-code:
# START by creating a `loop`.
# PRINT "What is the bill?"
# GET input from user with `gets.chomp` and SET it to a variable named `bill`.
# UNLESS `bill` == "0",
#   IF `bill.to_i` <= 0 PRINT "Invalid input: only positive integers, please."
#   NEXT
# SET `bill` = bill.to_i
# BREAK
# START new `loop`.
# PRINT "What is the tip percentage?"
# GET input from user with `gets.chomp` and SET it to a variable named `tip`.
# UNLESS `tip` == "0",
#   IF `tip.to_i` <= 0 PRINT "Invalid input: only positive integers, please."
#   NEXT
# SET `tip` = tip.to_i
# BREAK
# SET `tip_total` = (`tip` / 100) * `bill`
# SET `bill_total` = `bill` + `tip_total`
# PRINT "The tip is #{tip_total}"
# PRINT "The total is #{bill_total}"
# END

bill = ''
loop do
  puts "What is the bill?"
  bill = gets.chomp
  unless bill == "0"
    if bill.to_i <= 0
      puts "Invalid input: only positive integers, please."
      next
    else
      break
    end
  end
  break
end
bill = bill.to_f

tip = ''
loop do
  puts "What is the tip percentage?"
  tip = gets.chomp
  unless tip == "0"
    if tip.to_i <= 0
      puts "Invalid input: only positive integers, please."
      next
    else
      break
    end
  end
  break
end
tip = tip.to_f

tip_total = (tip / 100) * bill
bill_total = bill + tip_total

puts "The tip is $#{tip_total}"
puts "The total is $#{bill_total}"

puts "-------"

# Launch School solution:

print 'What is the bill?'
bill = gets.chomp
bill = bill.to_f

print 'What is the tip percentage?'
percentage = gets.chomp
percentage = percentage.to_f

tip = (bill * (percentage / 100)).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{tip}"
puts "The total is $#{total}"

# Further Exploration:
# Our solution prints the results as $30.0 and $230.0 instead of the more usual
# $30.00 and $230.00 . Modify your solution so it always prints the results
# with 2 decimal places.

print 'What is the bill?'
bill = gets.chomp
bill = bill.to_f

print 'What is the tip percentage?'
percentage = gets.chomp
percentage = percentage.to_f

tip = (bill * (percentage / 100)).round(2)
total = (bill + tip).round(2)
tip = "%.2f" % tip
total = "%.2f" % total

puts "The tip is $#{tip}"
puts "The total is $#{total}"
