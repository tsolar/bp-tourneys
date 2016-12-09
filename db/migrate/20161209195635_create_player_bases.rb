class CreatePlayerBases < ActiveRecord::Migration[5.0]
  def change
    create_table :player_bases do |t|
      t.string :name

      t.timestamps
    end
  end
end
