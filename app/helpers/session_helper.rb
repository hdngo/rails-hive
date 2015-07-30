module SessionHelper

  def signin(bumblebee_username)
      @bumblebee = Bumblebee.where(username: bumblebee_username).first

    if @bumblebee && @bumblebee.password == params[:password]
      session[:user_id] = @bumblebee.id
    end
  end

  def current_user
    puts "hello this is my session id"
    puts session[:user_id]
    @current_user ||= Bumblebee.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !@current_user.nil?
  end

  def signout
    session[:user_id] = nil
  end

end
