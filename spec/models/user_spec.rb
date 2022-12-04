require 'rails_helper'

RSpec.describe User, :type => :model do
  

  describe "Validations" do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:lastname) }
  end
  describe 'Associations' do
    it { should have_many(:events).with_foreign_key('creator_id').class_name('Event') }
    it { should have_many(:categories).with_foreign_key('creator_id').class_name('Category') }
    it { should have_many(:event_attendees).with_foreign_key('attendee_id') }
    it do
      should have_many(:attended_events)
        .class_name('Event')
        .through(:event_attendees)
        .source(:event)
    end
    
  end
end