# seat_approach.rb

# require 'minitest/autorun'

# class CarTest < MiniTest::Test

#   def test_car_exists
#     car = Car.new
#     assert(car)
#   end

#   def test_wheels
#     car = Car.new
#     assert_equal(4, car.wheels)
#   end

#   def test_name_is_nil
#     car = Car.new
#     assert_nil(car.name)
#   end

#   def test_raise_initialize_with_arg
#     assert_raises(ArgumentError) do
#       car = Car.new(name: "Joey")
#     end
#   end

#   def test_instance_of_car
#     car = Car.new
#     assert_instance_of(Car, car)
#   end

#   def test_includes_car
#     car = Car.new
#     arr = [1, 2, 3]
#     arr << car

#     assert_includes(arr, car)
#   end
# end

# After refactoring to extract the redudant piece of code, `car = Car.new`, to
# one place using the `setup` method:

require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end
end
