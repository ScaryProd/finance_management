class UserController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_url
    else
      flash.now[:notice] = "Por favor llena el registro correctamente."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
