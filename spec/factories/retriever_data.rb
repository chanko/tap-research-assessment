FactoryBot.define do
  factory :campaigns_retriever_data, class: Hash do
    id { Faker::Number.number(digits: 5) }
    cpi { Faker::Number.decimal(l_digits: 2, r_digits: 2).to_s }
    length_of_interview { Faker::Number.number(digits: 2) }
    name { Faker::Food.dish }
    total_remaining { Faker::Number.number(digits: 3) }
    status { Faker::Number.number(digits: 1) }
    supplier_link { Faker::Internet.url }
    incidence { Faker::Number.number(digits: 3) }
    reentry_interval { nil }
    days_in_field { Faker::Number.number(digits: 1) }
    max_daily_completes { nil }
    is_retarget { false }

    factory :campaign_quotas_retriever_data, class: Hash do
      campaign_quotas { [build(:campaign_quota)] }
    end

    initialize_with { attributes } 
  end

  factory :campaign_quota, class: Hash do
    id { Faker::Number.number(digits: 5) }
    num_respondents { Faker::Number.number(digits: 3) }
    name { Faker::Food.dish }
    campaign_qualifications { build(:campaign_qualification) }

    initialize_with { attributes } 
  end

  factory :campaign_qualification, class: Hash do
    question_id { Faker::Number.number(5) }
    pre_codes { Array.new(rand(1..100)) { rand(1..100) } }

    initialize_with { attributes } 
  end
end
