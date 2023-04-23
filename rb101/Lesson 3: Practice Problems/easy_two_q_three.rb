# easy_two_q_three.rb

# We have most of the Munster familyl in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash:

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# My response:

ages.merge!(additional_ages)

