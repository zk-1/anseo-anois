class UsersController < ApplicationController
  before_action :set_current_user
  before_action :insist_on_registered_user, only: %i[ show ]

  def show
    @user = User.find(params[:id])
  end
end
