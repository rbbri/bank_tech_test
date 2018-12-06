require_relative 'account_config'
require_relative 'ledger'
require 'observer'
# Account interface for client
class Account
  include Observable

  def initialize(config: AccountConfig.new, ledger: Ledger.new)
    @balance = 0
    @config = config
    @ledger = ledger
    add_observer ledger
  end

  attr_reader :balance, :config

  def deposit(amount)
    check_valid(amount, :credit)
    @balance += amount
    changed
    notify_observers(credit: amount, balance: balance)
  end

  def withdraw(amount)
    check_valid(amount, :debit)
    @balance -= amount
    changed
    notify_observers(debit: amount, balance: balance)
  end

  def statement
    @ledger.print_transactions
  end

  private

  def max_withdrawal
    balance - min_balance
  end

  def min_balance
    config.min_balance
  end

  def min_deposit
    config.min_deposit
  end

  def min_withdrawal
    config.min_withdrawal
  end

  def check_valid(amount, method)
    case method
    when :credit
      raise "Minimum deposit is #{min_deposit}" if amount < min_deposit
    when :debit
      raise "Maximum withdrawal is #{max_withdrawal}" if amount > max_withdrawal
      raise "Minimum withdrawal is #{min_withdrawal}" if amount < min_withdrawal
    end
  end
end
