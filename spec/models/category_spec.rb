require 'rails_helper'

RSpec.describe Category, :type => :model do
  

  describe "Validations" do
    subject { Category.new(name: "Any",creator_id:1) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end
  describe 'Associations' do
    it { should belong_to(:creator).class_name('User') }

    it { should have_many(:event_categories).with_foreign_key('category_id') }
    it do
      should have_many(:events)
        .through(:event_categories)
        .source(:event)
    end
    
  end
end
