class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    Friendship.create(user_id: current_user.id, friend_id: friend.id)
    flash[:notice] = "#{friend.first_name} has been added to your friends list!"
    redirect_to dashboard_path
  end
end
