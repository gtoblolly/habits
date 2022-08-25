FactoryBot.define do
  factory :habit do
    title     {Faker::Lorem.sentence}
    content   {Faker::Lorem.sentence}
    level     {0}
    exp_sum   {0}
    association :user
  end
end
