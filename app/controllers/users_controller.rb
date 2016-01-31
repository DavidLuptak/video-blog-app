class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all.order('created_at DESC')
  end
end
