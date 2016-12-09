class CreateTeamBases < ActiveRecord::Migration[5.0]
  def change
    create_table :team_bases do |t|
      t.string :name

      t.timestamps
    end
  end
end
