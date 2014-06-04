
Given(/^a maker having (\d+)<> on his account$/) do |balance|
  @maker = FactoryGirl.create(:maker)
  @maker.accounts.first.balance = balance
end

When(/^I go the the accounts page$/) do
  pending
end

Then(/^I see my account with (\d+)<>$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^a maker Alice$/) do
  @alice = FactoryGirl.create(:maker)
end

Given(/^a maker Bob$/) do
  @bob = FactoryGirl.create(:maker)
end

When(/^Alice sends (\d+)<> to Bob$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^Bob's account is increased by (\d+)<>$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^Alice's account is decreased by (\d+)<>$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

