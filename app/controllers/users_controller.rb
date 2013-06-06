class UsersController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome"
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:sucess] = "User destroyed"
  end
  
  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
