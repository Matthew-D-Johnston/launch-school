# nil_assertions.rb

# Write a minitest assertion that will fail if `value` is not `nil`.

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class TestNilValue < Minitest::Test
  attr_reader :value

  def setup
    @value = 1
  end

  def test_nil_value
    assert_nil value
  end

end

# assert_nil value
# or assert_nil(value)
