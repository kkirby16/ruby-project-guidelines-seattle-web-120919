class CreateHikes < ActiveRecord::Migration[5.0]
    def change
      create_table :hikes do |t|
        t.string :name
        t.integer :difficulty_level
        t.string :address
        t.timestamps
     #or put length as an integer aka 5.5 for 5.5 mile hike?
      end
    end
  end