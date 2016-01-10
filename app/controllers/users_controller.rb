class UsersController < ApplicationController
  def index
    @users = User.all
  end
 
  def show
    @user = User.find(params[:id])
  end
 
  def new
    if cookies.signed[:user_id]
    	redirect_to referrals_path
    else
    	# User.new
    	cookies.delete(:user_id)
    end
  end
 
  def edit
    @user = User.find(params[:id])
  end
 
  def create
    @user = User.new(user_params)

    if @user.save
      # @user.generate_referral_code
      if @user.referrals.exists?
      else
      	@user.referrals.save
      	byebug
      	@user.add_referral(email: params[:user][:email])
      end
      redirect_to referrals_path
      cookies.signed[:user_id] = @user.id
      cookies.permanent.signed[:login] = "testing"
    else
      render 'new'
    end
  end
 
  def update
    @user = User.find(params[:id])
 
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
 
  def destroy
    @user = User.find(params[:id])
    @user.destroy
 
    redirect_to users_path
  end
 
  private
    def user_params
      params.require(:user).permit(:email)
    end
end