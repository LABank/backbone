# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    uid "MyString"
    balance 1
    name "MyString"
  end
end
