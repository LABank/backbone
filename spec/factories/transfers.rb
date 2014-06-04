# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transfer do
    source_account_id 1
    destination_account_id 1
    maker_id 1
    amount 1
    description "MyText"
    day "2014-06-04"
  end
end
