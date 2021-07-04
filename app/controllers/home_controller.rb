class HomeController < ApplicationController
  before_action :authorize
  
  def index
    @user = User.find(session[:user_id])
  end

  def openDeliveries
    if logged_in? and isAdmin?
      @open_deliveries = Post.where("status = 0")
    else
      @open_deliveries = Post.where("user_id = ? and status = 0", session[:user_id])
    end
  end

  def closedDeliveries
    if logged_in? and isAdmin?
      @closed_deliveries = Post.where("status = 1")
    else
      @closed_deliveries = Post.where("user_id = ? and status = 1", session[:user_id])
    end
  end

end
