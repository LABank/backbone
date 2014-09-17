# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record do
    account
    description "MyText"
    amount 1
    wire_transfer_id 1
  end
end
