FactoryGirl.define do
  factory :team_basis, class: 'Team::Base' do
    sequence(:name) { |n| "Team #{n}" }

    factory :team_basis_invalid do
      name nil
    end
  end
end
