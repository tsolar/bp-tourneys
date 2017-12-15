FactoryBot.define do
  factory :tournament_basis, class: "Tournament::Base" do
    sequence(:name) { |n| "Tournament #{n}" }
    owner { User.last || FactoryBot.create(:user) }
    description { FFaker::HipsterIpsum.paragraph }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country_code { FFaker::Address.country_code }
    lat { FFaker::Geolocation.lat }
    lng { FFaker::Geolocation.lng }
    starts_at { Time.current }
    ends_at { Time.current + 1.week }

    factory :tournament_basis_invalid do
      name nil
      owner nil
    end
  end
end
