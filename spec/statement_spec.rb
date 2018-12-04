require 'statement'

describe Statement do
  before { Timecop.freeze(Time.now) }
  let(:time) { Time.now.strftime('%m/%d/%Y') }

  describe '#format_amount' do
    it 'formats an integer to 2 d.p.' do
      expect(Statement.format_amount(100)).to eq '100.00'
    end
  end

  describe '#format_date' do
    it 'formats a date' do
      expect(Statement.format_date(Time.now))
        .to eq time
    end
  end

  describe '#format_transaction' do
    it 'formats a transaction' do
      expect(Statement.format_transaction(credit: 100, balance: 150))
        .to eq "#{time} || 100.00 ||  || 150.00"
    end
  end
end
