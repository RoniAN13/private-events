class Category < ApplicationRecord
    validates :name,presence:true,uniqueness: true
    belongs_to :creator, class_name: 'User'
    has_many :event_categories,foreign_key: :category_id,dependent: :destroy
    has_many :events , through: :event_categories, source: :event
end
