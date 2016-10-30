class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]
  before_action :require_user

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def find_user
    @user = User.find_by(id: session[:user_id].to_i)
  end


end
