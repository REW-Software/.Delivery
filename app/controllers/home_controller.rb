# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authorize

  def index
    @user = User.find(session[:user_id])
  end

  def openDeliveries
    @open_deliveries = get_posts_by_user_and_status(session[:user_id], 0)
  end

  def closedDeliveries
    @closed_deliveries = get_posts_by_user_and_status(session[:user_id], 1)
  end

  def get_posts_by_user_and_status(user_id,  status)
    if logged_in? and isAdmin?
      Post.where(["status = ?", status])
    else
      Post.where(["user_id = ? and status = ?", user_id , status])
    end
  end
end
