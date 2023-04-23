# how_many.rb

vehicles = %w(car car truck car SUV truck motorcycle motorcycle car truck)

def count_occurrences(list)
  hsh = Hash.new(0)

  list.each do |elem|
    hsh[elem] += 1
  end

  hsh.each do |element, occurences|
    puts "#{element} => #{occurences}"
  end
end

count_occurrences(vehicles)
