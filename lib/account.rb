require 'account_config'
require 'ledger'
require 'observer'
# Account interface for client
class Account
  include Observable

  def initialize(config = AccountConfig.new)
    @balance = 0
    @config = config
    add_observer Ledger.new
  end

  attr_reader :balance, :config

  def deposit(amount)
    check_valid(amount, 'deposit')
    @balance += amount
    notify_observers(self, amount, 'credit')
  end

  def withdraw(amount)
    check_valid(amount, 'withdraw')
    @balance -= amount
    notify_observers(self, amount, 'debit')
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
    when 'deposit'
      raise "Minimum deposit is #{min_deposit}" if amount < min_deposit
    when 'withdraw'
      raise "Maximum withdrawal is #{max_withdrawal}" if amount > max_withdrawal
      raise "Minimum withdrawal is #{min_withdrawal}" if amount < min_withdrawal
    end
  end
end
