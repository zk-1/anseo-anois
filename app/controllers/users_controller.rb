class UsersController < ApplicationController
  before_action :set_current_user
  allow_unauthenticated_access only: %i[ new create ]
  before_action :insist_on_registered_user, only: %i[ show ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
