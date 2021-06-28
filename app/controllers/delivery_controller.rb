class DeliveryController < ApplicationController
  before_action :authorizeAdmin

  def new
    @delivery = Delivery.new
    filter_delivery_man if params[:tipo]
  end

  def create
    @delivery = Delivery.new(delivery_params)
    filter_delivery_man if params[:tipo]

    if @delivery.save
      redirect_to @delivery
    else
      render :new
    end
  end

  def index
    @deliveries = Delivery.all
  end

  def show
    @delivery = Delivery.find(params[:id])
  end

  private

  def filter_delivery_man
    @user = @user.select do |u| 
      u.tipo.deliveryMan == params[:tipo]
    end
  end

  def delivery_params
    params.require(:delivery).permit(:sale_id, :user_id, :status)
  end
end