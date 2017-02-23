FactoryGirl.define do
  factory :tournament_team, class: 'Tournament::Team' do
    team { FactoryGirl.create(:team_basis) }
    tournament { FactoryGirl.create(:tournament_basis) }
  end
end
