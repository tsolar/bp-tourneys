class Tournament::Base < ApplicationRecord
  has_many :tournament_teams,
           class_name: "Tournament::Team",
           foreign_key: :tournament_id,
           inverse_of: :tournament

  has_many :teams,
           class_name: "Team::Base",
           through: :tournament_teams,
           source: :team

  belongs_to :owner,
             optional: true,
             class_name: "User",
             foreign_key: :owner_id,
             inverse_of: :tournaments

  validates :name, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true

  validates :starts_at, timeliness: { type: :datetime }
  validates :ends_at, timeliness: { on_or_after: :starts_at, type: :datetime }, if: -> { ends_at.present? }

  def country_name
    country.try(:name).to_s
  end

  def country_emoji
    country.try(:emoji_flag).to_s
  end

  def country_name_with_emoji
    [country_emoji, country_name].join(" ").strip
  end
  private
    def country
      ISO3166::Country.new(country_code)
    end
end
