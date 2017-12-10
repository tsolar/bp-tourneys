class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :teams,
           class_name: "Team::Base",
           foreign_key: :owner_id,
           inverse_of: :owner

  has_many :tournaments,
           class_name: "Tournament::Base",
           foreign_key: :owner_id,
           inverse_of: :owner

  accepts_nested_attributes_for :teams, reject_if: :reject_teams

  def username
    email
  end

  # to use ActiveJob for sending emails
  # according to https://github.com/plataformatec/devise#activejob-integration
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  private
    def reject_teams(attributes)
      attributes["name"].blank?
    end
end
