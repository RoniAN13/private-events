class Event < ApplicationRecord
    validates :name,presence:true
    validates :creator_id,presence:true
    validates :description,presence:true
    validates :e_date,presence:true
    belongs_to :creator, class_name: 'User'
    has_many :event_attendees,foreign_key: :event_id,dependent: :destroy
    has_many :attendees , through: :event_attendees, source: :attendee
    has_many :event_categories,foreign_key: :event_id
    has_many :categories,through: :event_categories,source: :category
    def self.past
        return self.all.where("e_date < ?",Time.now)
    end    
    def self.upcoming
        return self.all.where("e_date >?",Time.now)
    end
end
