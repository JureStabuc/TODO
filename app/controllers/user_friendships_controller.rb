class UserFriendshipsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
	def new
		if params[:friend_id]
			@friend = User.where(profile_name: params[:friend_id]).first
			raise ActiveRecord::RecordNotFound if @friend.nil?
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			flash[:error] = "Friend required"
		end	
		rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found	
	end

	private

	def user_friendship_params
      params.require(:user_friendship).permit(:user, :friend, :user_id, :friend_id)
    end
end