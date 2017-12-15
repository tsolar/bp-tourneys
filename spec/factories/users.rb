FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "123456" }

    factory :admin do
      email { "admin@example.com" }
    end
  end

end
