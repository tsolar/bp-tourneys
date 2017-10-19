# coding: utf-8
class Tournament::Team < ApplicationRecord
  belongs_to :team,
             class_name: "Team::Base",
             foreign_key: :team_id
  belongs_to :tournament,
             class_name: "Tournament::Base",
             foreign_key: :tournament_id

  has_many :team_players,
           class_name: 'Tournament::TeamPlayer',
           foreign_key: :tournament_team_id,
           inverse_of: :tournament_team,
           dependent: :destroy

  has_many :players,
           class_name: 'Player::Base',
           through: :team_players,
           source: :player

  validates :team, presence: true
  validates :tournament, presence: true

  delegate :name, to: :team, prefix: true

  # One team per tournament!
  validates :team_id, uniqueness: { scope: :tournament_id }

  accepts_nested_attributes_for :team_players, allow_destroy: true
  accepts_nested_attributes_for :players, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :team, reject_if: :all_blank
end