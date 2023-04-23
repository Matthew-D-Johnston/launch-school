# empty_object_assertions.rb

# Write a minitest assertion that will fail if the Array `list` is not empty.

require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class EmptyArrayTest < MiniTest::Test
  attr_reader :list

  def setup
    @list = []
  end

  def test_empty_array
    assert_equal([], list)
    # or
    assert_empty(list)
    # or
    assert_equal(true, list.empty?)
  end
end

# or



# Thus: assert_equal [], list
# or: assert_empty list
# or: assert_equal true, list.empty?