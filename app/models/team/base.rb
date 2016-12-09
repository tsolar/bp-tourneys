class Team::Base < ApplicationRecord
  has_many :tournament_teams,
           class_name: 'Tournament::Team',
           foreign_key: :team_id

  has_many :tournaments,
           class_name: 'Tournament::Base',
           through: :tournament_teams,
           source: :tournament

  validates :name, presence: true
end
