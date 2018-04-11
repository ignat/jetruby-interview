FactoryBot.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "secret"
    password_confirmation "secret"
    factory :api_user do
      api_key "11223344556677889900aabbccddeeff"
    end
  end

  factory :appointment do
    user
    sequence(:title) { |n| "Title #{n}" }
    starts_at { 2.hours.since }
    factory :upcoming_appointment do
      starts_at { 4.hours.since }
      status :confirmed
    end
    factory :past_appointment do
      starts_at { 3.hours.ago }
      status :confirmed
    end
    factory :pending_appointment do
      starts_at { 3.hours.since }
      status :pending
    end
  end

  factory :reminder do
    appointment
    minutes_before_appointment 15
  end

end
