# transaction_test.rb

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

require 'minitest/reporters'
MiniTest::Reporters.use!

require 'simplecov'
SimpleCov.start

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(50)

    prior_amount = transaction.amount_paid
    input = StringIO.new("50\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    new_amount = transaction.amount_paid

    assert_equal(prior_amount + 50, new_amount)
  end
end