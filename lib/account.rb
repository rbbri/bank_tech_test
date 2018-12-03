# Account interface for client
class Account
  MIN_DEPOSIT = 1

  def initialize
    @balance = 0
  end

  attr_reader :balance

  def deposit(amount)
    raise "Minimum deposit is #{MIN_DEPOSIT}" if amount < MIN_DEPOSIT

    @balance += amount
  end
end
