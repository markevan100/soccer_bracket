FactoryBot.define do
  factory :team do
    sequence(:country) { |n| "Country #{n}" }
    sequence(:country_code) { |n| "C#{n}" }
    association :group
  end
end