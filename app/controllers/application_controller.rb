class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  helper_method :curret_user, :logged_in?

  def curret_user
    @curret_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!curret_user
  end

end
