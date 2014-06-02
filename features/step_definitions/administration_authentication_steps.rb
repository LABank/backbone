Given(/^an administrator$/) do
  @user = FactoryGirl.create(:admin)
end

When(/^he logs in$/) do
  sign_in @user
end

Then(/^he can view the administration page$/) do
  visit(admin_root_path)  
  current_path.should eq admin_root_path
end

Given(/^a maker$/) do
  @user = FactoryGirl.create(:maker)
end

Then(/^he cannot access the administration page$/) do
  visit(admin_root_path) 
  current_path.should eq root_path
end
