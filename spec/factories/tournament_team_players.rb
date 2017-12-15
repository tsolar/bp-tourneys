FactoryBot.define do
  factory :tournament_team_player, class: "Tournament::TeamPlayer" do
    player { FactoryBot.create(:player_basis) }
    tournament_team { FactoryBot.create(:tournament_team) }
    tournament { tournament_team.tournament }
  end
end
