class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = policy_scope(User).all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :country, :phone_number, :active, :age, :name, :photo)
  end
end
