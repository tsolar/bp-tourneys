class MyProfileController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    if current_user.update(user_params)
      flash[:success] = "Usuario actualizado."
    else
      flash[:success] = current_user.errors.messages
    end
    redirect_to my_profile_path
  end

  private
    def user_params
      params.require(:user).permit(
        teams_attributes: [
          :id,
          :name,
          :_destroy
        ]
      )
    end
end
