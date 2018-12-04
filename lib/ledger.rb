# Ledger to record account transactions
class Ledger
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def update(transaction)
    @transactions << format(transaction)
  end

  def print_transactions
    header + "\n" + @transactions.join("\n")
  end

  private

  def format(transaction)
    "#{Time.now} || " \
      "#{transaction[:credit]} || " \
      "#{transaction[:debit]} || " \
      "#{transaction[:balance]}"
  end

  def header
    'Date || Credit || Debit || Balance ' \
  end
end
