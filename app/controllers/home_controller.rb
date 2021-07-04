# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authorize

  def index
    @user = User.find(session[:user_id])
  end

  def openDeliveries
    @open_deliveries = if logged_in? and isAdmin?
                         Post.where('status = 0')
                       else
                         Post.where('user_id = ? and status = 0', session[:user_id])
                       end
  end

  def closedDeliveries
    @closed_deliveries = if logged_in? and isAdmin?
                           Post.where('status = 1')
                         else
                           Post.where('user_id = ? and status = 1', session[:user_id])
                         end
  end
end
