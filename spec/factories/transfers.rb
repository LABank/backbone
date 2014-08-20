# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transfer do
    association :source, factory: :account
    association :destination, factory: :account
    maker
    amount 1
    description "MyText"
    day "2014-06-04"
  end
end
