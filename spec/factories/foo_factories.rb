FactoryGirl.define do
  factory :foo do
    sequence(:name) { |n| "Foo #{n}" }
  end
end
