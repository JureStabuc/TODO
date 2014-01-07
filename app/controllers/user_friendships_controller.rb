class UserFriendshipsController < ApplicationController
	before_filter :authenticate_user, only: [:new]
	def new
		if params[:friend_id]
			@friend = User.find(params[:friend_id])
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			flash[:error] = "Friend required"
		end		
	end

	private

	def user_friendship_params
      params.require(:user_friendship).permit(:user, :friend, :user_id, :friend_id)
    end
end
