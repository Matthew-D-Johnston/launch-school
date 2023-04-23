# divisors.rb

def divisors(integer)
  divisors_array = []
  1.upto(integer) do |int|
    divisors_array << int if integer % int == 0
  end
  divisors_array
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891]

# Launch School's Solution:

def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891]

# Further Exploration

def divisors(integer)
  starting_divisors = [1]
  ending_divisors = []
  
  2.upto(integer) do |int|
    starting_divisors << int if integer % int == 0
    break if starting_divisors.last * int > integer
  end

  starting_divisors.each do |divisor|
    ending_divisors << integer / divisor
  end
  
  starting_divisors.concat(ending_divisors).uniq.sort
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891]

start = Time.now
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
finish = Time.now

puts diff = finish - start
# p divisors(81) == [1, 3, 9, 27, 81]
# p divisors(3653462) == [1, 2, 109, 218, 16759, 33518, 1826731, 3653462] 
# p divisors(234952) == [1, 2, 4, 8, 43, 86, 172, 344, 683, 1366, 2732, 5464, 29369, 58738, 117476, 234952] 
# p divisors(54287504354532) == [1, 2, 3, 4, 6, 12, 23, 46, 69, 92, 138, 276, 887, 1774, 2661, 3491, 3548, 5322, 6982, 10473, 10644, 13964, 20401, 20946, 40802, 41892, 61203, 63521, 80293, 81604, 122406, 127042, 160586, 190563, 240879, 244812, 254084, 321172, 381126, 481758, 762252, 963516, 1460983, 2921966, 3096517, 4382949, 5843932, 6193034, 8765898, 9289551, 12386068, 17531796, 18579102, 37158204, 56343127, 71219891, 112686254, 142439782, 169029381, 213659673, 221751811, 225372508, 284879564, 338058762, 427319346, 443503622, 665255433, 676117524, 854638692, 887007244, 1295891921, 1330510866, 2591783842, 2661021732, 3887675763, 5100291653, 5183567684, 7775351526, 10200583306, 15300874959, 15550703052, 20401166612, 30601749918, 61203499836, 196693856357, 393387712714, 590081569071, 786775425428, 1180163138142, 2360326276284, 4523958696211, 9047917392422, 13571876088633, 18095834784844, 27143752177266, 54287504354532]