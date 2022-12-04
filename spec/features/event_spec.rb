require 'rails_helper'
RSpec.describe 'Creating Events', type: :feature do
    before :each do
        user = User.create( id:1,firstname: 'Roni',lastname: 'Abou Nassif',email:'roni@gmail.com',password:'foobar')
        visit new_user_session_path
        fill_in 'Email', with: 'roni@gmail.com'
        fill_in 'Password', with: 'foobar'
        click_on 'Log in'
        visit new_event_path
      end
    scenario 'blank name event creation' do
        visit new_event_path
        fill_in 'Name', with: ''
        fill_in 'Description', with: 'Any description'
        fill_in 'event_e_date', with: '2020-12-12'
        click_on 'Add Event'
        expect(page).to have_content("Name can't be blank")
      end
      scenario 'blank description event creation' do
        visit new_event_path
        fill_in 'Name', with: 'Event'
        fill_in 'Description', with: ''
        fill_in 'event_e_date', with: '2020-12-12'
        click_on 'Add Event'
        expect(page).to have_content("Description can't be blank")
      end
      scenario 'blank e_date event creation' do
        visit new_event_path
        fill_in 'Name', with: 'Event'
        fill_in 'Description', with: 'Any description'
        fill_in 'event_e_date', with: ''
        click_on 'Add Event'
        expect(page).to have_content("E date can't be blank")
      end
      scenario 'Successful event creation' do
        visit new_event_path
        fill_in 'Name', with: 'Event'
        fill_in 'Description', with: 'Any description'
        fill_in 'event_e_date', with: '2020-12-12'
        expect(page.find(:select, 'event_attendee_ids')[:multiple]).to be_truthy
        expect(page.find(:select, 'event_category_ids')[:multiple]).to be_truthy
        click_on 'Add Event'
       event = Event.create(name:"Event",description:"Any description",e_date:"2020-12-12",creator_id:1)
         visit event_path(event)
        expect(page).to have_content('Event')
      end
      scenario 'Successful event update' do
        event = Event.create(name:"Event",description:"Any description",e_date:"2020-12-12",creator_id:1)
        visit edit_event_path(event)
        fill_in 'Name', with: 'Event1'
        fill_in 'Description', with: 'Any description'
        fill_in 'event_e_date', with: '2020-12-12'
        click_on 'Update Event'
         visit event_path(event)
        expect(page).to have_content('Event1')
      end
      scenario 'Delete event' do
        event = Event.create(name:"Event",description:"Any description",e_date:"2020-12-12",creator_id:1)
        visit event_path(event)
        click_on 'Delete'
        expect(page).to have_content('Event Deleted')
      end
end    
