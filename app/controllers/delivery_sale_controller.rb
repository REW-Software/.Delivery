class DeliverySaleController < ApplicationController
  before_action :authorizeAdmin

  def new
    @delivery_sale = Delivery_Sale.new
    filter_delivery_man if params[:tipo]
  end

  def create
    @delivery_sale = DeliverySale.new(delivery_params)
    filter_delivery_man if params[:tipo]

    if @delivery_sale.save
      redirect_to @delivery_sale
    else
      render :new
    end
  end

  def index
    @deliveries_sales = DeliverySale.all
  end

  def show
    @delivery_sale = DeliverySale.find(params[:id])
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