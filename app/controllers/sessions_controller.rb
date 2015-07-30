class SessionsController < ApplicationController
  include SessionHelper
  def login
    if params[:username]
      @bumblebee = Bumblebee.where(username: params[:username]).first

      signin(@bumblebee.username)
      puts session[:user_id]
      redirect_to @bumblebee
    else
     render 'login'
   end

  end

  def logout
    signout
    redirect_to root_path
  end
end


