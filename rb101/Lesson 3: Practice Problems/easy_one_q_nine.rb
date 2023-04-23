# easy_one_q_nine.rb
# Given the hash below

flintstones = { "Fred" => 0, 
                "Wilma" => 1, 
                "Barney" => 2, 
                "Betty" => 3, 
                "BamBam" => 4, 
                "Pebbles" => 5 
              }

# Turn this into an array containing only two elements: Barney's name and
# Barney's number.

flintstones = flintstones.select { |k, v| k == "Barney" }.flatten
p flintstones   # => ["Barney", 2]

# Launch School's Solution

flintstones = { "Fred" => 0, 
                "Wilma" => 1, 
                "Barney" => 2, 
                "Betty" => 3, 
                "BamBam" => 4, 
                "Pebbles" => 5 
              }

p flintstones.assoc("Barney")
