module AddressesHelper

  def check_user_id
    @user = User.find(params[:user_id])
    unless current_user == @user or isAdmin?
      redirect_to @current_user
    end
  end

end
