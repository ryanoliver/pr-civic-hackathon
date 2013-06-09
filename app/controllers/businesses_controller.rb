class BusinessesController < ApplicationController
  def show
    @business = Business.find(params[:id])
  end

  def showcal
    #@business = Business.find(params[:id])
    @events = [
               {
                title: 'event1',
                start: '2013-06-04'
               },
               {
                title: 'event2',
                start: '2013-06-05',
                end: '2013-06-07'
               },
               {
                title: 'event3',
                start: '2013-06-08 12:30:00',
                end: '2013-06-08 13:30:00',
                allDay: false
               }
              ]

    gon.events = @events
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
