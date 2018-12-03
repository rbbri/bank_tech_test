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
    raise "Minimum deposit is #{MIN_DEPOSIT}" if amount < MIN_DEPOSIT
    @balance += amount
  end

  def withdraw(amount)
    raise "Maximum withdrawal is #{max_withdrawal}" if amount > max_withdrawal
    @balance -= amount
  end

  private

  def max_withdrawal
    @balance - MIN_BALANCE
  end
end
