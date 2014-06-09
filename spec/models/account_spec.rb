require 'spec_helper'

describe Account do
  it {should have_many :records}  
  it { should have_many :credentials}
  it 'should create a unique uid by default upon creation' do
    account = FactoryGirl.create(:account, uid: nil)
    account.uid.should_not be_nil
  end
  it 'should use the uid provided upon creation' do
    account = FactoryGirl.create(:account, uid: "bidule")
    account.uid.should eq("bidule")
  end

  it 'should have a unique uid' do
    first = FactoryGirl.create(:account, uid: "bidule")
    second = FactoryGirl.build(:account, uid: "bidule")
    second.should_not be_valid
  end

end
