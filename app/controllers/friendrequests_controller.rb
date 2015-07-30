class FriendrequestsController < ApplicationController
  include SessionHelper

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friendrequests.new(friend: friend)
  end

  def index
    @incoming = Friendrequest.where(friend: current_user)
    @outgoing = current_user.friendrequests
  end

  def destroy
    @friend_request.destroy
    head :no_content
  end

  def update
    @friend_request.accept
    head :no_content
  end

end
