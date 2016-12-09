FactoryGirl.define do
  factory :tournament_team, class: 'Tournament::Team' do
    team { Team::Base.last || FactoryGirl.create(:team_basis) }
    tournament { Tournament::Base.last || FactoryGirl.create(:tournament_basis) }
  end
end
