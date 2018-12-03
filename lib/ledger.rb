# Ledger to record account transactions
class Ledger
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def update(amount, method)
    @transactions << [amount, method, Time.now]
  end
end
