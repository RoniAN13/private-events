class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :description
      t.date :e_date

      t.timestamps
    end
  end
end
