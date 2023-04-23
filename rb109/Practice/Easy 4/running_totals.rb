# running_totals.rb

# arr is the original array
# [arr[0],

def running_total(arr)
  running_total_arr = [0]

  arr.each do |elem|
    running_total_arr << elem + running_total_arr.last
  end

  running_total_arr.shift
  running_total_arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


