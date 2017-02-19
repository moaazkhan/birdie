class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Devise custom parameters are not allowed hence to enable it following code is required.else nothing would be
  # saved in username or name.
  #params permission start
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:name,:location])
  end
  #params permission end

  def after_sign_in_path_for(resource)
  username_path(current_user) #your path
  end
end
