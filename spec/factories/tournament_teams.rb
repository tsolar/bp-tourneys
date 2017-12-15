FactoryBot.define do
  factory :tournament_team, class: "Tournament::Team" do
    # team { FactoryBot.create(:team_basis) }
    tournament { FactoryBot.create(:tournament_basis) }
    team_attributes { FactoryBot.attributes_for(:team_basis) }

    team_players_attributes {
      FactoryBot.attributes_for_list(
        :tournament_team_player,
        3,
        tournament: nil,
        tournament_team: nil
      )
    }

    factory :tournament_team_invalid do
      tournament nil
      team_attributes { FactoryBot.attributes_for(:team_basis, name: "") }
      team_players_attributes {}
    end
  end
end
