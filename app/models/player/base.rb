class Player::Base < ApplicationRecord
  has_many :tournament_team_players,
    class_name: "Tournament::TeamPlayer",
    inverse_of: :player,
    autosave: true

  validates :name, presence: true
  validates :nickname, uniqueness: { scope: :name }
  validates :name, uniqueness: true, unless: -> { nickname.present? }

  def to_s
    name
  end

  def to_label
    if nickname.present?
      "#{name} (#{nickname})"
    else
      name
    end
  end
end
