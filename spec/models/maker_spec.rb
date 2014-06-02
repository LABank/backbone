require 'spec_helper'

describe Maker do
  it 'should have a valid factory' do
    maker = FactoryGirl.build(:maker)
    maker.should be_valid
  end

  it { should have_many :memberships}
  it { should respond_to :administrator}
end
