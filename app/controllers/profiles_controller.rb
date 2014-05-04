class ProfilesController < ApplicationController

  def index
    #if params[:query].present?
      #@user = User.search(params[:query], page: params[:page])
    #else
      #@user = User.all.page params[:page]
    #end
  end

  def show
  	@user = User.find_by_profile_name(params[:id])
  	if @user 
  		@todo_lists = @user.todo_lists.all
  		render action: :show
  	else
  	render file: 'public/404', status: 404, formats: [:html]
  end

  def create
    @user = User.create( user_params )
  end
end

private
  
  def user_params
    params.require(:user).permit(:avatar)
  end
 
end
