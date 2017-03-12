FactoryGirl.define do
  factory :tournament_team_player, class: 'Tournament::TeamPlayer' do
    player { FactoryGirl.create(:player_basis) }
    tournament_team { FactoryGirl.create(:tournament_team) }
    tournament { tournament_team.tournament }
  end
end
