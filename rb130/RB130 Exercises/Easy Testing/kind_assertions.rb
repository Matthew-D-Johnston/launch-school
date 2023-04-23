# kind_assertions.rb

# Write a minitest assertion that will fail if the class of `value` is not
# `Numeric` or one of `Numeric`'s subclasses (e.g. `Integer`, `Float`, etc).

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class KindTest < Minitest::Test
  attr_reader :value

  def setup
    @value = 4.54
  end

  def test_kind
    assert_kind_of(Numeric, value)
  end
end

# Thus: assert_kind_of Numeric, value
