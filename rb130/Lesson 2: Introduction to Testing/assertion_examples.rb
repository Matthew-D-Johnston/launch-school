# assertion_examples.rb

require 'minitest/autorun'
# require "minitest/reporters"
# MiniTest::Reporters.use!

require_relative 'car'

# 1) assert
# => assert(test)
# => fails unless `test` is truthy.

class CarTest < MiniTest::Test
  def test_car_exists
    car = Car.new
    assert(car)
  end
end

# 2) assert_equal
# => assert_equal(exp, act)
# => fails unless `exp == act`

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end

# 3) assert_nil
# => assert_nil(obj)
# => fails unless `obj` is `nil`

class CarTest < MiniTest::Test
  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end
end

# 4) assert_raises
# => assert_raises(*exp)
# => fails unless block raises one of `*exp`

class CarTest < MiniTest::Test
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")   # this code raises ArgumentError,
    end                             # so this assertion passes
  end
end

# 5) assert_instance_of
# => assert_instance_of(cls, obj)
# => fails unless `obj` is an instance of `cls`

class CarTest < MiniTest::Test
  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end
end

# 6) assert_includes
# => assert_includes(collection, obj)
# => fails unless `collection` includes `obj`

class CarTest < MiniTest::Test
  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
end