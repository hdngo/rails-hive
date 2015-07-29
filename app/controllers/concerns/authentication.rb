module Authentication
  extend ActiveSupport::Concern

  include do
    helper_method :signin
    helper_method :current_user
    helper_method :logged_in?
    helper_method :logout
  end

  def signin(bumblebee_username)
      @bumblebee = Bumblebee.where(username: bumblebee_username).first

    if @bumblebee && @bumblebee.password == params[:password]
      session[:id] = @bumblebee.id
      p "this is the session id"
      p session[:id]
      p "this is the username"
      p current_user.username
      redirect_to @bumblebee
    else
      render 'login'
    end
  end

  def current_user
    @current_user ||= Bumblebee.find_by(id: session[:id]) if session[:id]
  end

  def logged_in?
    !@current_user.nil?
  end

  def signout
    session[:id] = nil
  end

end
