class User::TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team::Base.where(owner: current_user)
  end
end
