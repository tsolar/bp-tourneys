class Tournament::TeamPlayer < ApplicationRecord
  belongs_to :player
  belongs_to :tournament_team
end
