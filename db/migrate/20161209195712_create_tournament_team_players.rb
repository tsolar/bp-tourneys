class CreateTournamentTeamPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :tournament_team_players do |t|
      t.references :player, foreign_key: { to_table: :player_bases }
      t.references :tournament, foreign_key: { to_table: :tournament_bases }
      t.references :tournament_team, foreign_key: true

      t.timestamps
    end
  end
end
