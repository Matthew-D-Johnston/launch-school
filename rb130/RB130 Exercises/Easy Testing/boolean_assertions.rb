# boolean_assertions_test.rb

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class BooleanTest < Minitest::Test
  def test_odd
    assert_equal(true, 3.odd?)
    assert_equal(true, 2.odd?)
  end
end

# Launch School's Solution:

class BooleanTest < Minitest::Test
  def test_odd
    assert 2.odd?, 'value is not odd'
  end
end
