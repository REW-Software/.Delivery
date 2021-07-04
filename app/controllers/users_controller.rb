class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:show, :edit, :update, :destroy]
  before_action :authorizeAdmin, except: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @newDeliveryMan = params[:newClient]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.user_type == 'Administrador'
      redirect_to @user
    else
      @user.destroy
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :birth, :email, :cpf, :rg, :user_type, :password, :password_confirmation)
  end
end
