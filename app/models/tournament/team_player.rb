# coding: utf-8

class Tournament::TeamPlayer < ApplicationRecord
  belongs_to :player,
             class_name: "Player::Base",
             inverse_of: :tournament_team_players

  belongs_to :tournament_team,
             class_name: "Tournament::Team",
             inverse_of: :team_players

  belongs_to :tournament,
             class_name: "Tournament::Base"

  validates :player, presence: true
  validates :tournament_team, presence: true
  validates :tournament, presence: true

  accepts_nested_attributes_for :player, reject_if: :all_blank
  before_validation :set_tournament

  # A player can be only once in a team per tournament
  validates :player_id, uniqueness: { scope: [:tournament_id] }

  def player_attributes=(attributes)
    # set player because otherwise it fails with
    # "Couldn't find Player::Base with ID=25 for Tournament::TeamPlayer with ID="
    # when relating an existing player to a new Tournament::TeamPlayer
    self.player = Player::Base.find_by(id: attributes["id"])

    # check every attribute except id, if is blank.
    # If attribute is blank, then remove it from attributes,
    # to not modify it on the associated object
    attributes.except("id").each do |key, attr|
      attributes.delete(key) if attr.blank?
    end
    super(attributes)
  end

  private
    def set_tournament
      self.tournament = tournament_team.tournament if tournament_team.present?
    end
end
