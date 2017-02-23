# coding: utf-8
class Tournament::TeamPlayer < ApplicationRecord
  belongs_to :player,
             class_name: 'Player::Base'
  belongs_to :tournament_team,
             class_name: 'Tournament::Team'

  validates :player, presence: true
  validates :tournament_team, presence: true

  # A player can be only once in a team per tournament
  validates :player_id, uniqueness: { scope: [:tournament_team_id] }

  validate :check_player_in_tournament

  private
  def check_player_in_tournament
    # if Tournament::TeamPlayer.joins(:tournament_team).where(player: self.player_id).where(tournament_teams: {tournament_id: self.tournament_team.tournament_id}).any?
    #   errors.add(:player, "ya está este jugador en el torneo en otro equipo")
    #   false
    # end
    errors.add(:player, "ya está este jugador en el torneo en otro equipo")
  end
end
