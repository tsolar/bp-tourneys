class Tournament::Base < ApplicationRecord
  has_many :tournament_teams,
           class_name: 'Tournament::Team',
           foreign_key: :tournament_id,
           inverse_of: :tournament

  has_many :teams,
           class_name: 'Team::Base',
           through: :tournament_teams,
           source: :team

  belongs_to :owner,
             optional: true,
             class_name: 'User',
             foreign_key: :owner_id,
             inverse_of: :tournaments

  validates :name, presence: true
end
