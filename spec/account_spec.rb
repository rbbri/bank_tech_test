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
      expect{ account.balance = 100 }.to raise_error NoMethodError
    end
  end

  describe '#deposit' do
    it 'should add an amount to the account' do
      expect { account.deposit(1) }.to change { account.balance }.from(0).to(1)
    end
    it 'should only accept deposits over a a minimum amount' do
      min = Account::MIN_DEPOSIT
      expect { account.deposit(-1) }.to raise_error "Minimum deposit is #{min}"
    end
  end
end
