class UsersController < ApplicationController
  load_and_authorize_resource only: [:index]

  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    render :_profile
  end
end
