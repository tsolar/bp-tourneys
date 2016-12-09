FactoryGirl.define do
  factory :tournament_team, class: 'Tournament::Team' do
    team nil
    tournament nil
  end
end
