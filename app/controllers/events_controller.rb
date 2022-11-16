class EventsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  def index
    @events = Event.all
    @previous_events = Event.past
    @upcoming_events = Event.upcoming
  end
  def create
    @event= current_user.events.build(event_params)

     if @event.save 
        if params[:event][:attendee_ids].present?
          params[:event][:attendee_ids].each do |attendee|
            EventAttendee.new(attendee_id:attendee,event_id:@event.id).save
          end
        end 
       redirect_to @event
      
     else 
      render 'new'
     end
  end 
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
     
      redirect_to @event
    
    else
      render 'edit'
    end
  end 

  def new
    @event = Event.new

  end
  def show 
    @event= Event.find(params[:id])
  end  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end
 private 
 
  def event_params
    params.require(:event).permit(:name,:description,:e_date,:attendee_ids)
  end
   
end
