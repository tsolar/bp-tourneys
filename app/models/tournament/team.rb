class Tournament::Team < ApplicationRecord
  belongs_to :team,
             class_name: "Team::Base",
             foreign_key: :team_id
  belongs_to :tournament,
             class_name: "Tournament::Base"
end
