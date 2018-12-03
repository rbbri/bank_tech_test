# Account configuration class
class AccountConfig
  attr_reader :min_balance, :min_denomination, :min_deposit, :min_withdrawal

  def initialize(min_balance = 0,
                 min_denomination = 0.01,
                 min_deposit = 0.01,
                 min_withdrawal = 0.01)
    @min_balance = min_balance
    @min_denomination = min_denomination
    @min_deposit = min_deposit
    @min_withdrawal = min_withdrawal
  end
end
