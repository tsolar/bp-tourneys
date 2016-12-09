class Tournament::Base < ApplicationRecord
  has_many :tournament_teams,
           class_name: 'Tournament::Team',
           foreign_key: :tournament_id

  has_many :teams,
           class_name: 'Team::Base',
           through: :tournament_teams,
           source: :team

  validates :name, presence: true
end
