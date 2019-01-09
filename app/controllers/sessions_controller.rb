class SessionsController < Devise::SessionsController
  def create
    flash.notice = "Привет, #{current_user.full_name}!"
  end
end
