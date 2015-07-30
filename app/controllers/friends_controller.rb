class FriendsController < ApplicationController

  def index
    @friends = current_user.friends
  end

  def destroy
    current_user.remove_friend(@friend)
    head :no_content
  end

  def set_friend
    @friend = current_user.friends.fiend(params[:id])
  end
end
