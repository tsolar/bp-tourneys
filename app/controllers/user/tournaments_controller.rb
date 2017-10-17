class User::TournamentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tournaments = Tournament::Base.where(owner: current_user)
  end
end
