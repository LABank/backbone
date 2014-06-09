
Given(/^a maker having (\d+)<> on his account$/) do |balance|
  @maker = FactoryGirl.create(:maker)
  @account = @maker.accounts.first
  @account.balance = balance
  @account.save
  sign_in @maker
end

When(/^I go the the accounts page$/) do
  visit(accounts_path)
end


When(/^Alice start a new transfer$/) do
  visit(accounts_path)
  click_link '.new_transfer'
end

When(/^provides the amout, the destination account and the description$/) do
  fill_in '.amout', with: '100'
  fill_in '.destination', with: @bob.accounts.first.uid
  fill_in '.description', with: 'Just do it' 

end

When(/^she validates the transfer$/) do
   click_button '.submit'
end

Then(/^I see my account with (\d+)<>$/) do |arg1|
  page.should have_selector '.balance', text: '100<>'
end

Given(/^a maker Alice$/) do
  @alice = FactoryGirl.create(:maker)
  @alice.accounts.first.update_attribute(:balance, 200)
end

Given(/^a maker Bob$/) do
  @bob = FactoryGirl.create(:maker)
  @bob.accounts.first.update_attribute(:balance, 300)
end

Then(/^Bob's account is increased by (\d+)<>$/) do |arg1|
  @bob.accounts.first.balace.should eq(400)
end

Then(/^Alice's account is decreased by (\d+)<>$/) do |arg1|
  @alice.accounts.first.balace.should eq(100)
end

