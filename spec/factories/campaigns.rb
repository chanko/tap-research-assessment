FactoryBot.define do
  factory :campaign do
    cpi { rand(1.0..20.0).round(2) }
    length_of_interview { rand(1..60) }
    name { Faker::Food.dish }
  end
end
