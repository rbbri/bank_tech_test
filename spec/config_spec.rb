require 'account_config'

describe AccountConfig do
  it { is_expected.to respond_to(:min_balance) }
  it { is_expected.to respond_to(:min_denomination) }
  it { is_expected.to respond_to(:min_deposit) }
  it { is_expected.to respond_to(:min_withdrawal) }
end
