class EventsController < ApplicationController
  def index
    render :json => Event.all
  end

  def create
    puts "The value is #{params[:bid]}"
    render :json => 
      Event.create!(:start => params[:start], :end => params[:end], :title => params[:title],
                    :color => params[:color], :bisId => params[:bid])
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes!(:start => params[:start], :end => params[:end], 
                             :title => params[:title],:color => params[:color])
    render :json => event
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy    
    render :json => event
  end
  
  def show
    render  :json => Event.find(:all, :conditions => { :bisId => params[:id] })
  end
end
