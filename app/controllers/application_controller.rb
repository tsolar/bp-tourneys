class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception #, prepend: true

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def user_not_authorized
      flash[:alert] = I18n.t("unauthorized")
      redirect_to(request.referrer || root_path)
    end
end
