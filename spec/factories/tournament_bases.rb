FactoryGirl.define do
  factory :tournament_basis, class: 'Tournament::Base' do
    sequence(:name) { |n| "Tournament #{n}" }
  end
end
