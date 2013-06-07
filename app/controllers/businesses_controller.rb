class BusinessesController < ApplicationController
  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @user = User.find_by_remember_token(cookies[:remember_token])
    @business = Business.new(params[:business])
     @business.userId = @user
    if @business.save
      flash[:success] = "Business Added"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @business = Business.all
  end

  def destroy
    Business.find(params[:id]).destroy
    flash[:success] = "Business destroyed"
  end

end
