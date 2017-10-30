FactoryGirl.define do
  factory :tournament_team, class: 'Tournament::Team' do
    # team { FactoryGirl.create(:team_basis) }
    tournament { FactoryGirl.create(:tournament_basis) }
    team_attributes { FactoryGirl.attributes_for(:team_basis) }
    # players_attributes {
    #   FactoryGirl.attributes_for_list(
    #     :player_basis,
    #     3
    #   )
    # }

    factory :tournament_team_invalid do
      tournament nil
      team_attributes { FactoryGirl.attributes_for(:team_basis, name: "") }
      players_attributes {}
    end
  end
end
