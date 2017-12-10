class AddOwnerToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_reference :tournament_bases, :owner, foreign_key: { to_table: :users }
  end
end
