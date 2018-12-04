# formats an account statement
module Statement
  def self.format_transaction(transaction)
    "#{format_date(Time.now)} || " \
    "#{format_amount(transaction[:credit])} || " \
    "#{format_amount(transaction[:debit])} || " \
    "#{format_amount(transaction[:balance])}"
  end

  def self.format_amount(amount)
    format('%.2f', amount) unless amount.nil?
  end

  def self.format_date(date)
    date.strftime('%m/%d/%Y')
  end

  def self.header
    'Date || Credit || Debit || Balance '
  end

  def self.print_transactions(transactions)
    header + "\n" + transactions.reverse.join("\n")
  end
end
