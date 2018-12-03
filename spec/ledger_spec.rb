require 'ledger'

describe 'Ledger' do
  let(:ledger) { Ledger.new }

  describe '#initialize' do
    it 'has an empty array of transactions' do
      expect(ledger.transactions).to be_empty
    end
  end

  describe '#record_transaction' do
    before { Timecop.freeze(Time.now) }
    it 'records a transaction type, amount and date' do
      ledger.record_transaction(100, 'credit')
      expect(ledger.transactions.last).to include(100, 'credit', Time.now)
    end
  end
end
