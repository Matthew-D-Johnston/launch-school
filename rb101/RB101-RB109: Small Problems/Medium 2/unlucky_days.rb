# unlucky_days.rb

def friday_13th(year)
  unlucky = 0
  1.upto(12) { |month| unlucky += 1 if Time.gm(year, month, 13).friday? }
  unlucky
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
puts friday_13th(1983) == 1

puts '------'

# Launch School Solution:

require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
puts friday_13th(1983) == 1

puts '-----'

# Further Exploration:

def five_fridays(year)
  months_with_five = 0
  month_counter = 1

  1.upto(12) do |month|
    fridays = 0

    1.upto(31) do |day|
      time = Time.gm(year, month, day)
      fridays += 1 if time.month == month_counter && time.friday?
    end

    months_with_five += 1 if fridays == 5
    month_counter += 1
  end

  months_with_five
end

puts five_fridays(1983)
puts five_fridays(2000)
puts five_fridays(2018)
puts five_fridays(2019)
puts five_fridays(2020)
puts five_fridays(2021)
puts five_fridays(2022)



