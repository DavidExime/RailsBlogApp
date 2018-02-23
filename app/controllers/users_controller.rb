class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:message] = 'user created ok'
      redirect_to '/users'
    else
      flash[:message] = 'try again dummy!'
      redirect_to users_new_path
    end
  end

  

  def show
    @user = User.find_by_id(params[:id])
   
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:message] = 'Your account has been updated Successfully'
      redirect_to "/user/#{@user.id}"
    else
      flash[:message] = 'try again'
      render "/users/#{@user.id}/edit"
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to '/'
  end


  private
  def user_params
    params.require(:user).permit(:fname, :lname, :username, :password)
  end

end


