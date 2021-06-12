class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
    # @product = Product.all
  end

  def create
    @sale = Sale.new(sale_params)
    # @product = Product.all

    if @sale.save
      redirect_to @sale
    else
      render :new
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])

    if @sale.update(sale_params)
      redirect_to @sale
    else
      render :edit
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    redirect_to sales_path
  end

  private
  def sale_params
    params.require(:sale).permit(:product_id, :payment_type, :quantity_product, :name_client, :phone_client, :street, :number)
  end
end
