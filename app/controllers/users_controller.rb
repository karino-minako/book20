class UsersController < ApplicationController
before_action :authenticate_user!
  def index
  	  @users = User.all
  end

  def show
  	  @user = User.find(params[:id])
      @books = @user.books
  end

  def create
      @user = User.new(user_params)
      @usrs.user_id = current_user.id
      if @user.save
      redirect_to user_path
      else
      render :new
      end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
