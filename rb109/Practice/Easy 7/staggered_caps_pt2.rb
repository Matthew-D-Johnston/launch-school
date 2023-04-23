# staggered_caps_pt2.rb

def staggered_case(string)
  staggered_string = ''
  idx = 0

  string.each_char do |char|
    if char.match?(/[a-z]/i)
      if idx.even?
        staggered_string << char.upcase
        idx += 1
      else
        staggered_string << char.downcase
        idx += 1
      end
    else
      staggered_string << char
    end
  end

  staggered_string
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
