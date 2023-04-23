# cash_register_test.rb

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

require 'minitest/reporters'
require 'simplecov'

Minitest::Reporters.use!
SimpleCov.start

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    transaction.amount_paid = 50

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 50, current_amount)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    transaction.amount_paid = 60

    difference = transaction.amount_paid - transaction.item_cost

    assert_equal(difference, register.change(transaction))
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    transaction2 = Transaction.new(60)

    assert_output("You've paid $50.\n") { register.give_receipt(transaction) }
  end
end