class Player::Base < ApplicationRecord
  has_many :tournament_team_players,
    class_name: "Tournament::TeamPlayer",
    inverse_of: :player,
    autosave: true

  def to_s
    name
  end
end
