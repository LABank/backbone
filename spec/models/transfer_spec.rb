require 'spec_helper'

describe Transfer do
  it {should belong_to :source}  
  it {should belong_to :destination}  
  it {should belong_to :maker}  
  it "should have a valid factory" do
    transfer = FactoryGirl.create(:transfer)
    transfer.should be_valid
  end

  describe 'validity' do 
    it 'should inforce positive amount' do
      FactoryGirl.build(:transfer, amount: 10).should be_valid
      FactoryGirl.build(:transfer, amount: -10).should_not be_valid
    end
    
    it 'must have a valid source'
    it 'must have a valid destination'
  end
  
  it 'should create the corresponding records' do
    expect {
      FactoryGirl.create(:transfer)
    }.to change {Record.count}.by(2)
  end

  it 'should copy the details to the destination' do   
    t = FactoryGirl.create(:transfer)
    record = Record.last
    record.description.should eq(t.description)
    record.amount.should eq(t.amount)
    record.account_id.should eq(t.destination_id)
    record.day.should eq(t.day)
    record.wire_transfer_id.should eq(t.id)
  end

  it 'should copy the details to the source' do   
    t = FactoryGirl.create(:transfer)
    record = Record.all[-2]
    record.description.should eq(t.description)
    record.amount.should eq(-t.amount)
    record.account_id.should eq(t.source_id)
    record.day.should eq(t.day)
    record.wire_transfer_id.should eq(t.id)
  end
end
