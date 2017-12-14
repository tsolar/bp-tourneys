class AddAttributesToTournamentBases < ActiveRecord::Migration[5.1]
  def change
    add_column :tournament_bases, :description, :text
    add_column :tournament_bases, :starts_at, :datetime
    add_column :tournament_bases, :ends_at, :datetime
    add_column :tournament_bases, :address, :string
    add_column :tournament_bases, :city, :string
    add_column :tournament_bases, :country_code, :string
    add_column :tournament_bases, :lat, :float
    add_column :tournament_bases, :lng, :float
  end
end
