# what_century_is_that.rb

def century(year)
  century = ((year - 1) / 100) + 1

  leveler = century % 100

  if (11..20).to_a.include?(leveler)
    suffix = 'th'
  else
    case leveler % 10
    when 1 then suffix = 'st'
    when 2 then suffix = 'nd'
    when 3 then suffix = 'rd'
    else suffix = 'th'
    end
  end
  "#{century}#{suffix}"
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
