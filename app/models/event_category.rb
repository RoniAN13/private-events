class EventCategory < ApplicationRecord
    belongs_to :event ,class_name: "Event"
    belongs_to :category, class_name: "Category"
end
