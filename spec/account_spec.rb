require 'account'

describe 'Account' do
  subject(:account) { Account.new }

  describe '#initialize' do
    it 'should create an account with a balance of zero' do
      expect(account.balance).to equal 0
    end
  end

  describe '#balance' do
    it 'should return the balance' do
      expect(account.balance).to equal 0
    end
    it 'should not let a client change the balance' do
      account.balance + 100
      expect(account.balance).to equal 0
    end
  end

end
