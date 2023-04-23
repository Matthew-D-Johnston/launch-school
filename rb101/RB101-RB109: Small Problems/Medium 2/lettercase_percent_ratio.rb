# lettercase_percent_ratio.rb
# See lettercase_percent_ratio.md for PEDAC outline.
def letter_percentages(string)
  case_pct = { lowercase: 0, uppercase: 0, neither: 0 }
  percentage_factor = (100 / string.length.to_f)

  string.each_char do |char|
    if /[^a-z]/i.match?(char)
      case_pct[:neither] += percentage_factor
    elsif char == char.downcase
      case_pct[:lowercase] += percentage_factor
    else
      case_pct[:uppercase] += percentage_factor
    end
  end

  case_pct.each do |type, percent| 
    case_pct[type] = percent.round if percent % 1 == 0
  end

  case_pct
end

puts letter_percentages('abCdef 123')
puts letter_percentages('AbCd +Ef')
puts letter_percentages('123')
puts letter_percentages('abcdefGHI')

puts '-------'

# Launch School solution:

def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/}

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

puts letter_percentages('abCdef 123')
puts letter_percentages('AbCd +Ef')
puts letter_percentages('123')
puts letter_percentages('abcdefGHI')

puts '-------'

# Further Exploration:

def letter_percentages(string)
  case_pct = { lowercase: 0, uppercase: 0, neither: 0 }
  percentage_factor = (100 / string.length.to_f)

  string.each_char do |char|
    if /[^a-z]/i.match?(char)
      case_pct[:neither] += percentage_factor
    elsif char == char.downcase
      case_pct[:lowercase] += percentage_factor
    else
      case_pct[:uppercase] += percentage_factor
    end
  end

  case_pct.each do |type, percent|
    if percent % 1 == 0
      case_pct[type] = percent.round
    else
      case_pct[type] = percent.round(2)
    end
  end

  case_pct
end

puts letter_percentages('abCdef 123')
puts letter_percentages('AbCd +Ef')
puts letter_percentages('123')
puts letter_percentages('abcdefGHI')


