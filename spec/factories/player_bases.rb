FactoryBot.define do
  factory :player_basis, class: "Player::Base" do
    name { FFaker::Name.name }
  end
end
