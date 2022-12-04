class EventAttendeesController < ApplicationController
before_action :set_event
    def create
       
        @event_attendee = EventAttendee.new(attendee_id:current_user.id,event_id:@event.id)
        if @event_attendee.save
            flash[:notice]= "Attended Successfully"
            redirect_to @event
            
        end    

    end
    def destroy
        @event_attendee = EventAttendee.find_by(attendee_id:current_user.id,event_id:@event.id)
        @event_attendee.destroy
        flash[:alert]="Left Event"
        redirect_to @event
    end  
      
    private
     def set_event
        @event = @event= Event.find(params[:event_id])
     end
end
