require 'spec_helper'

describe Transfer do
  it {should belong_to :source}  
  it {should belong_to :destination}  
  it {should belong_to :maker}  

  describe 'validity' do 
    it 'should inforce positive amount'
    it 'must have a valid source'
    it 'must have a valid destination'
  end
  it 'should auto assign the current date as day if not provided upon creation'
end
