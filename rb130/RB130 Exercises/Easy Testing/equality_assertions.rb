# equality_assertions.rb

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class DowncaseTest < Minitest::Test
  def setup
    @value = 'XYZ'
  end

  def test_downcase
    assert_equal('xyz', @value.downcase)
  end
end

# assert_equal('xyz', value.downcase)
# or assert_equal 'xyz', value.downcase