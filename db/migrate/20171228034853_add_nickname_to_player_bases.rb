class AddNicknameToPlayerBases < ActiveRecord::Migration[5.1]
  def change
    add_column :player_bases, :nickname, :string
  end
end
