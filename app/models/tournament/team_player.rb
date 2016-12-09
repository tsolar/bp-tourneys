class Tournament::TeamPlayer < ApplicationRecord
  belongs_to :player,
             class_name: 'Player::Base'
  belongs_to :tournament_team,
             class_name: 'Tournament::Team'

  validates :player, presence: true
  validates :tournament_team, presence: true
end
