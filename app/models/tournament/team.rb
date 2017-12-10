# coding: utf-8

class Tournament::Team < ApplicationRecord
  belongs_to :team,
             class_name: "Team::Base",
             foreign_key: :team_id,
             inverse_of: :tournament_teams

  belongs_to :tournament,
             class_name: "Tournament::Base",
             foreign_key: :tournament_id,
             inverse_of: :tournament_teams

  has_many :team_players,
           class_name: "Tournament::TeamPlayer",
           foreign_key: :tournament_team_id,
           inverse_of: :tournament_team,
           dependent: :destroy,
           autosave: true # esto no sirve "parece"

  has_many :players,
           class_name: "Player::Base",
           through: :team_players,
           source: :player

  validates :team, presence: true
  validates :tournament, presence: true

  delegate :name, to: :team, prefix: true

  # One team per tournament!
  validates :team_id, uniqueness: { scope: :tournament_id }

  accepts_nested_attributes_for :team_players, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :players, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :team, reject_if: :all_blank

  # def team_players_attributes=(attributes)
  #   self.team_players = attributes.values.map do |team_player|
  #     ttp = Tournament::TeamPlayer.find_by(id: team_player['id'])
  #     unless ttp.present?
  #       debugger
  #       ttp = Tournament::TeamPlayer.create(player_attributes: team_player["player_attributes"])
  #     end
  #     debugger
  #     ttp
  #   end
  #   debugger
  #   super(attributes)
  # end
end
