class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    #UserMailer.welcome_email(@user).deliver

      # format.html { redirect_to(@user, :notice => 'User was successfully created.') }
      # format.json { render :json => @user, :status => :created, :location => @user }
    end

    def new
      @user = User.new
    end

    def index
      @user = User.all

    end

    def update
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        sign_in @user
        redirect_to @user
      else
        render 'edit'
      end
    end

    def edit
    #@user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end

#   def create
#     @user = User.new(user_params)
#     if @user.save
#       flash[:success] = "Welcome to the Sample App!"
#       redirect_to @user
#     else
#       render 'new'
#     end
#   end

#   private

#   def user_params
#     params.require(:user).permit(:name, :email, :password,
#      :password_confirmation)
#   end
# end