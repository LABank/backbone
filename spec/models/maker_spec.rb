require 'spec_helper'

describe Maker do
  it 'should have a valid factory' do
    maker = FactoryGirl.build(:maker)
    maker.should be_valid
  end

  it { should have_many :memberships}
  it { should have_many :credentials}
  it { should have_many :accounts}
  it { should respond_to :administrator}
  it { should validate_presence_of :first_name}
  it { should validate_presence_of :last_name}

  it 'should be displayable in active admin' do
    maker = FactoryGirl.create(:maker, first_name: 'Benoit', last_name: "Gantaume")
    maker.to_label.should eq('Gantaume Benoit')
  end

  it 'should create a bank account with r/w access on creation' do
    maker = FactoryGirl.create(:maker)
    maker.accounts.size.should eq(1)
    maker.credentials.first.right.should eq('write')
  end
   
end
