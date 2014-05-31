require 'spec_helper'

describe Membership do
  it {should belong_to :maker}
  it {should belong_to :entity}
end
