require 'spec_helper'

describe Account do
  it {should have_many :records}  
  it { should have_many :credentials}

end
