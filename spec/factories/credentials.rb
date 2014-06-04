# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credential do
    maker_id 1
    account_id 1
    right "MyString"
  end
end
