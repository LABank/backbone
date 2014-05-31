# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    date "2014-05-31"
    entity_id 1
    fee 1
    newsletter false
  end
end
