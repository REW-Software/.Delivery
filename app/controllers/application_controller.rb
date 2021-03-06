class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include AddressesHelper
  def authorize
    unless logged_in?
      redirect_to root_url
    end
  end

  def authorizeAdmin
    if logged_in?
      unless isAdmin?
        redirect_to home_path
      end
    end
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user or isAdmin?
      redirect_to @current_user
    end
  end




end
