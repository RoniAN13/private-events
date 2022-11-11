class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events , foreign_key: :creator_id ,class_name: 'Event',dependent: :destroy
  has_many :event_attendees,foreign_key: :attendee_id
  has_many :attended_events,through: :event_attendees,source: :event
  def attended?(event)
    if EventAttendee.where(attendee_id:self.id,event_id:event.id).exists?
      return true
    else return false
    end


  end
end
