require 'spec_helper'

describe Record do
  it {should belong_to :account}  
  it 'should update the accounts amount upon creation' do
    account = FactoryGirl.create(:account, balance: 200)
    record = FactoryGirl.create(:record, account: account, amount: 10)
    account.balance.should eq(210)
  end
end
