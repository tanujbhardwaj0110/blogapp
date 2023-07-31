class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        session[:username] = @user.username
        format.html { redirect_to posts_path(), notice: 'Logged in successfully' }
        format.json { render :show , status: :created, location: @user}
      else
        format.html { redirect_to login_path(), notice: "Invalid username or password" }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end
end
