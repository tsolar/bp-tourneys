class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :teams,
           class_name: 'Team::Base',
           foreign_key: :owner_id,
           inverse_of: :owner

  has_many :tournaments,
           class_name: 'Tournament::Base',
           foreign_key: :owner_id,
           inverse_of: :owner

  accepts_nested_attributes_for :teams, reject_if: :reject_teams

  def username
    email
  end

  private
  def reject_teams(attributes)
    attributes['name'].blank?
  end
end
