require 'ledger'

describe Ledger do
  let(:ledger) { described_class.new }
  before { Timecop.freeze(Time.now) }
  let(:time) { Time.now.strftime('%m/%d/%Y') }
  describe '#initialize' do
    it 'has an empty array of transactions' do
      expect(ledger.transactions).to be_empty
    end
  end

  describe '#update' do
    it 'records a transaction type, amount and date as a string' do
      ledger.update(credit: 100, balance: 150)
      expect(ledger.transactions.last)
        .to eq "#{time} || 100.00 ||  || 150.00"
    end
  end

  describe '#print_transactions' do
    it 'returns a header and all transactions' do
      ledger.update(credit: 100, balance: 150)
      ledger.update(debit: 50, balance: 100)
      expect(ledger.print_transactions)
        .to eq 'Date || Credit || Debit || Balance ' + "\n" \
               "#{time} ||  || 50.00 || 100.00" + "\n" \
               "#{time} || 100.00 ||  || 150.00"
    end
  end
end
