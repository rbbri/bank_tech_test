require 'account'

describe 'Account' do
  describe '#initialize' do
    it 'should create an account with a balance of zero' do
      account = Account.new
      expect(account.balance).to equal 0
    end
  end
end
