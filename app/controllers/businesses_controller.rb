class BusinessesController < ApplicationController
  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(params[:business])
    if @business.save
      flash[:success] = "Business Added"
    else
      render 'new'
    end
  end

  def destroy
    Business.find(params[:id]).destroy
    flash[:success] = "Business destroyed"
  end

end
