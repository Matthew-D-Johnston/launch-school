# included_object_assertions.rb

# write a minitest assertion that will fail if the `xyz` is not in the Array
# list.

require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

class IncludedObjectTest < Minitest::Test
  attr_reader :list

  def setup
    @list = ['abc', 'cde', 'xyz']
  end

  def test_included_object
    assert_includes(list, 'xyz')
  end
end

# Thus: assert_includes list, 'xyz'