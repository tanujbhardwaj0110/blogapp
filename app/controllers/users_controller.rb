class UsersController < ApplicationController
  def new
    @user = User.new
    @error_messages = notice.presence
  end

  def posts
    if logged_in?
      @user = User.find(session[:user_id])
      @posts = @user.posts.all
    else
      redirect_to "/login" , notice: "You must be logged in to view your posts"
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice] = "User created successfully"
        format.html { redirect_to login_path(), notice1: "User created successfully .PLease Login to continue" }
        format.json { render :show , status: :created, location: @user}
      else
        @error_messages = @user.errors.full_messages
        format.html { redirect_to signup_path(), notice: @error_messages }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
