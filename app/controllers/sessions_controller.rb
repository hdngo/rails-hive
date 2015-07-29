class SessionsController < ApplicationController
  def login
    if params[:username]
      @bumblebee = Bumblebee.where(username: params[:username]).first

      signin(@bumblebee.username)
    else
     render 'login'
   end

  end

  def logout
    signout
    redirect_to root_path
  end
end


