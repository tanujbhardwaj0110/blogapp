class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice] = "User created successfully"
        format.html { redirect_to login_path(), notice: "User created successfully .PLease Login to continue" }
        format.json { render :show , status: :created, location: @user}
      else
        format.html { redirect_to signup_path(), notice: "Password must be greater than 6 characters" }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
