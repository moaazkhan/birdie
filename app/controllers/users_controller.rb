class UsersController < ApplicationController

  def edit_picture
    @user = current_user
  end

  def update_picture
    @user = current_user.update(user_params)
    redirect_to username_path(current_user.username)
  end

  private

  def user_params
    params.require(:user).permit(:picture)
  end

end
