FactoryBot.define do
  factory :record do
    text  {Faker::Lorem.sentence}
    association :habit
    association :user
    after(:build) do |record|
      record.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
