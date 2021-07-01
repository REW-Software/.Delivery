class HomeController < ApplicationController
  before_action :authorize

  def admin; end

  def deliveryMan; end

  def openDeliveries
    if logged_in? and isAdmin?
      @openDeliveries = Post.where("status = 0")
    else
      @openDeliveries = Post.where("user_id = ? and status = 0", session[:user_id])
    end
  end

  def closedDeliveries
    if logged_in? and isAdmin?
      @closedDeliveries = Post.where("status = 1")
    else
      @closedDeliveries = Post.where("user_id = ? and status = 1", session[:user_id])
    end
  end

end
