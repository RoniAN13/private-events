class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :creator_id,null:false

      t.timestamps
    end
  end
end
