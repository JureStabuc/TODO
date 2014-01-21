class UserController < ApplicationController

  def index
    if params[:query].present?
      @users = User.search(params[:query], page: params[:page])
    else
      @users = User.all.page params[:page]
    end
  end
end
