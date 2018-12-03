require 'account'

describe 'Account' do
  subject(:account) { Account.new }
  let(:min_denomination) { Account::MIN_DENOMINATION }
  let(:min_deposit) { Account::MIN_DEPOSIT }
  let(:min_withdrawal) { Account::MIN_WITHDRAWAL }


  describe '#initialize' do
    it 'should create an account with a balance of zero' do
      expect(account.balance).to equal 0
    end
  end

  describe '#balance' do
    it 'returns the balance' do
      expect(account.balance).to equal 0
    end
    it 'raises an error if a client tries to set the balance' do
      expect { account.balance += 100 }
        .to raise_error(NoMethodError)
    end
  end

  describe '#deposit' do
    it 'adds an amount to the account' do
      expect { account.deposit(1) }
        .to change { account.balance }.from(0).to(1)
    end
    it 'raises an error if the deposit is under a minimum amount' do
      invalid_deposit = min_deposit - min_denomination
      expect { account.deposit(invalid_deposit) }
        .to raise_error("Minimum deposit is #{min_deposit}")
    end
  end

  describe '#withdraw' do
    before do
      account.deposit(min_deposit)
    end
    it 'subtracts an amount from account' do
      expect { account.withdraw(min_denomination) }
        .to change { account.balance }.from(0.01).to(0)
    end
    it 'raises an error if the withdrawal is under a minimum amount' do
      invalid_withdrawal = min_withdrawal - min_denomination
      expect { account.deposit(invalid_withdrawal) }
        .to raise_error("Minimum deposit is #{min_deposit}")
    end
    it 'raises an error if withdrawal exceeds available funds' do
      max = account.balance
      invalid_withdrawal = max + min_denomination
      expect { account.withdraw(invalid_withdrawal) }
        .to raise_error "Maximum withdrawal is #{max}"
    end
  end
end
