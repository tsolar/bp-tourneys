class CreateTournamentTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :tournament_teams do |t|
      t.references :team, foreign_key: { to_table: :team_bases }
      t.references :tournament, foreign_key: { to_table: :tournament_bases }

      t.timestamps
    end
  end
end
