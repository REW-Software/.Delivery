class AddressesController < ApplicationController
  before_action :authorize

  def new
    @user = User.find_by(params[:user_id])
    @address = Address.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    #@address = Address.new(address_params)
    @address = @user.create_address(address_params)

    redirect_to @user
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @address = @user.address

    unless @address.present?
      redirect_to new_user_address_path
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    @address = @user.address
  end

  def update
    @user = User.find_by(id: params[:id])
    @address = @user.address

    @address.update(address_params)
    @address.save

    redirect_to @user
  end

  def address_params
    params.require(:address).permit(:cep, :city, :district, :street, :number)
  end
end
