require 'rails_helper'
RSpec.describe 'Attending Event', type: :feature do
    before :each do
        user = User.create( id:1,firstname: 'Roni',lastname: 'Abou Nassif',email:'roni@gmail.com',password:'foobar')
        user = User.create( id:2,firstname: 'Ron',lastname: 'AN',email:'ron@gmail.com',password:'foobar')
       
        visit new_user_session_path
        fill_in 'Email', with: 'roni@gmail.com'
        fill_in 'Password', with: 'foobar'
        click_on 'Log in'
       
      end
      scenario "attend event" do 
        event = Event.create(id:1,name:"Event",description:"Any description",e_date:"2020-12-12",creator_id:2)
        visit event_path(event)
        click_on "Attend"
        expect(page).to have_content("Attended Successfully")
      end
      scenario "leave event" do 
        event = Event.create(id:1,name:"Event",description:"Any description",e_date:"2020-12-12",creator_id:2)
        EventAttendee.create(attendee_id:1,event_id:1)
        visit event_path(event)
      
        click_on "Leave"
        
        expect(page).to have_content("Left Event")
      end
    end