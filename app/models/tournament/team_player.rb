# coding: utf-8
class Tournament::TeamPlayer < ApplicationRecord
  belongs_to :player,
             class_name: 'Player::Base'
  belongs_to :tournament_team,
             class_name: 'Tournament::Team'
  belongs_to :tournament,
             class_name: 'Tournament::Base'

  validates :player, presence: true
  validates :tournament_team, presence: true
  validates :tournament, presence: true

  accepts_nested_attributes_for :player, reject_if: :all_blank, allow_destroy: true
  before_validation :set_tournament

  # A player can be only once in a team per tournament
  validates :player_id, uniqueness: { scope: [:tournament_id] }

  private
  def set_tournament
    self.tournament = tournament_team.tournament if tournament_team.present?
  end
end
