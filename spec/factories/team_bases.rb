FactoryGirl.define do
  factory :team_basis, class: 'Team::Base' do
    sequence(:name) { |n| "Team #{n}" }
  end
end
