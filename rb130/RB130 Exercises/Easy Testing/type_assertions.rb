# type_assertions.rb

# Write a minitest assertion that will fail if `value` is not an instance of
# the `Numeric` class exactly. `value` may not be an instance of one of
# `Numeric`'s superclasses.

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class TypeTest < MiniTest::Test
  attr_reader :value

  def setup
    @value = Numeric.new
  end

  def test_type
    assert_instance_of Numeric, value
  end
end

# assert_instance_of Numeric, value
# #or
# assert_instance_of(Numeric, value)

