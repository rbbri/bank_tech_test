require 'ledger'

describe Ledger do
  let(:ledger) { described_class.new }
  before { Timecop.freeze(Time.now) }

  describe '#initialize' do
    it 'has an empty array of transactions' do
      expect(ledger.transactions).to be_empty
    end
  end

  describe '#update' do
    it 'records a transaction type, amount and date as a string' do
      ledger.update(credit: 100, balance: 150)
      expect(ledger.transactions.last)
        .to eq "#{Time.now} || 100 ||  || 150"
    end
  end

  describe '#print_transactions' do
    it 'returns a header and all transactions' do
      ledger.update(credit: 100, balance: 150)
      expect(ledger.print_transactions)
        .to eq 'Date || Credit || Debit || Balance ' + "\n" \
               "#{Time.now} || 100 ||  || 150"
    end
  end
end
