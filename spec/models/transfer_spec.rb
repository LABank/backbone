require 'spec_helper'

describe Transfer do
  it {should belong_to :source}  
  it {should belong_to :destination}  
  it {should belong_to :maker}  
end
