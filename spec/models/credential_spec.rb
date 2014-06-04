require 'spec_helper'

describe Credential do
  it {should belong_to :maker}    
  it {should belong_to :account}  
end
