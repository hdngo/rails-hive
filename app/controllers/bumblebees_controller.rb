class BumblebeesController < ApplicationController
  include Authentication
  def show
    @bumblebee = Bumblebee.find(params[:id])
  end

  def new
    @bumblebee = Bumblebee.new
  end

  def edit
    @bumblebee = Bumblebee.find(params[:id])
  end

  def create
    @bumblebee = Bumblebee.new(bumblebee_params)

    if @bumblebee.save
      session[:id] = @bumblebee.id
      redirect_to @bumblebee
    else
      render 'new'
    end
  end

  def update
    @bumblebee = Bumblebee.find(params[:id])

    if @bumblebee.update(bumblebee_params)
      redirect_to @bumblebee
    else
      render 'edit'
    end
  end

  private
    def bumblebee_params
      params.require(:bumblebee).permit(:username, :email, :password, :first_name, :last_name)
    # if we have validations on a field in our model, we need to have that field permitted
    end
end
