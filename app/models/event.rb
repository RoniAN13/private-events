class Event < ApplicationRecord
    validates :name,presence:true
    validates :description,presence:true
    validates :e_date,presence:true
    belongs_to :creator, class_name: 'User'
    has_many :event_attendees,foreign_key: :event_id,dependent: :destroy
    has_many :attendees , through: :event_attendees, source: :attendee

    def self.past
        return self.all.where("e_date < ?",Time.now)
    end    
    def self.upcoming
        return self.all.where("e_date >?",Time.now)
    end
end
