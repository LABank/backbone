FactoryGirl.define do
  factory :maker do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password "motdepasse"
    administrator false
    factory :admin do
      administrator true
    end     

    after(:create) {|maker| maker.confirm! }
  end
end
