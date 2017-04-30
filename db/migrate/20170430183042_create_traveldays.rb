class CreateTraveldays < ActiveRecord::Migration[5.0]
  def change
    create_table :traveldays do |t|
      t.text :content
      t.integer :budget, default: 0
      t.timestamps
    end
  end
end
