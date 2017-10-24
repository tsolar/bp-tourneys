class Team::Base < ApplicationRecord
  has_many :tournament_teams,
           class_name: 'Tournament::Team',
           foreign_key: :team_id

  has_many :tournaments,
           class_name: 'Tournament::Base',
           through: :tournament_teams,
           source: :tournament

  belongs_to :owner,
             optional: true,
             class_name: 'User',
             foreign_key: :owner_id,
             inverse_of: :teams

  validates :name, presence: true
  validates :name, uniqueness: true
end
