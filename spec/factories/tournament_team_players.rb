FactoryGirl.define do
  factory :tournament_team_player, class: 'Tournament::TeamPlayer' do
    player nil
    tournament_team nil
  end
end
