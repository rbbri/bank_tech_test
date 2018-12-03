# Account interface for client
class Account
  MIN_BALANCE = 0
  MIN_DENOMINATION = 0.01
  MIN_DEPOSIT = 0.01
  MIN_WITHDRAWAL = 0.01

  def initialize
    @balance = 0
  end

  attr_reader :balance

  def deposit(amount)
    check_valid(amount, 'deposit')
    @balance += amount
  end

  def withdraw(amount)
    check_valid(amount, 'withdraw')
    @balance -= amount
  end

  private

  def max_withdrawal
    @balance - MIN_BALANCE
  end

  def check_valid(amount, method)
    case method
    when 'deposit'
      raise "Minimum deposit is #{MIN_DEPOSIT}" if amount < MIN_DEPOSIT
    when 'withdraw'
      raise "Maximum withdrawal is #{max_withdrawal}" if amount > max_withdrawal
      raise "Minimum withdrawal is #{MIN_WITHDRAWAL}" if amount < MIN_WITHDRAWAL
    end
  end
end
