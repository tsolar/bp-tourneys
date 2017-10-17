FactoryGirl.define do
  factory :team_basis, class: 'Team::Base' do
    sequence(:name) { |n| "Team #{n}" }
    owner { User.last || FactoryGirl.create(:user) }

    factory :team_basis_invalid do
      name nil
      owner nil
    end
  end
end
