FactoryBot.define do
  factory :record do
    text  {Faker::Lorem.sentence}
    exp   {2}
    after(:build) do |record|
      record.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
    association :habit
  end
end
