class UsersController < ApplicationController

  def new
    @user = User.new
    @user.build_profile #has_one
    # @user.profiles.build # has many
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "thank you for registering"
    else
      # @user.build_profile unless @user.profile.present?
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
       {profile_attributes: [:first_name, :last_name, :address, :id]})
  end
end
