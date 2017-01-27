# Controller to create new user
class UserController < ApplicationController
  # Requires user_params detailed below.
  def create
    @user = User.new(user_params)

    # Upon successful user registration, will proceed to root_url.
    # Else, it will refresh the page and flash an error notice.
    if @user.save
      sign_in(@user)
      redirect_to root_url
    else
      flash.now[:notice] = "Por favor llena el registro correctamente."
      render :new
    end
  end

  private

  # Required parameters: Full name, email, and password respectively.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
