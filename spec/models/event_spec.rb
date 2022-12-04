require 'rails_helper'

RSpec.describe Event, :type => :model do
    describe "Validations" do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:description) }
        it { should validate_presence_of(:e_date) }
        it { should validate_presence_of(:creator_id) }
      end
    describe 'associations' do
        it do
          should belong_to(:creator)
            .class_name('User')
            
        end
        it do
          should have_many(:attendees)
            .class_name('User')
            .through(:event_attendees)
            .source(:attendee)
        end
        it do
            should have_many(:event_attendees)
              .with_foreign_key(:event_id)
          end
          it do
            should have_many(:event_categories)
              .with_foreign_key(:event_id)
          end
          it do
            should have_many(:categories)
              .through(:event_categories)
              .source(:category)
          end
        
      end
end
