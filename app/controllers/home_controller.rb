class HomeController < ApplicationController
  def admin; end

  def deliveryMan; end

  def openDeliveries
    @openDeliveries = Post.where("user_id = ? and status = 0", session[:user_id])
  end

  def closedDeliveries
    @closedDeliveries = Post.where("user_id = ? and status = 1", session[:user_id])
  end

end
