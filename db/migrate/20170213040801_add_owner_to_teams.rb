class AddOwnerToTeams < ActiveRecord::Migration[5.0]
  def change
    add_reference :team_bases, :owner, foreign_key: { to_table: :users }
  end
end
