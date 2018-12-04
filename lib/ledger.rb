require './lib/statement'
# Ledger to record account transactions
class Ledger
  include Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def update(transaction)
    @transactions << Statement.format_transaction(transaction)
  end

  def print_transactions
    Statement.print_transactions(transactions)
  end
end
