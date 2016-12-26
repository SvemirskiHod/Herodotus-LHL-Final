class UsersController < ApplicationController

  def create
    @user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
  end
end
