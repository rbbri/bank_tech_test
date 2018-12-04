# Ledger to record account transactions
class Ledger
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def update(transaction)
    @transactions << format_statement(transaction)
  end

  def print_transactions
    header + "\n" + @transactions.reverse.join("\n")
  end

  private

  def format_statement(transaction)
    "#{format_date(Time.now)} || " \
      "#{format_amount(transaction[:credit])} || " \
      "#{format_amount(transaction[:debit])} || " \
      "#{format_amount(transaction[:balance])}"
  end

  def format_amount(amount)
    format('%.2f', amount) unless amount.nil?
  end

  def format_date(date)
    date.strftime('%m/%d/%Y')
  end

  def header
    'Date || Credit || Debit || Balance ' \
  end
end
