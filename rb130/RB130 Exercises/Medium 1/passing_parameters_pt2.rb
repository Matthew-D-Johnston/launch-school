# passing_parameters_pt2.rb

birds = %w(raven finch hawk eagle)

def selective_contents(array)
  yield(array)
end

selective_contents(birds) do |_, _, *raptors| 
  puts "Raptors: #{raptors.join(', ')}."
end
