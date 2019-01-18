class SessionsController < Devise::SessionsController
  def create
    super
    if current_user.full_name.blank?
      flash[:success] = "Привет, " + current_user.email.split('@')[0]
    else
      flash[:success] = "Привет, #{current_user.full_name}!"
    end
  end
end
