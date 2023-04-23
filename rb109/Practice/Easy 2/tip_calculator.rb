# tip_calculator.rb

print "What is the bill? "
bill_amt = gets.chomp.to_f

print "What is the tip percentage? "
tip_rate = gets.chomp.to_f

tip_total = bill_amt * (tip_rate / 100)
tip_total_string = format("%.2f", tip_total)

bill_total = bill_amt + tip_total
bill_total_string = format("%.2f", bill_total)

puts "The tip is $#{tip_total_string}"
puts "The total is $#{bill_total_string}"