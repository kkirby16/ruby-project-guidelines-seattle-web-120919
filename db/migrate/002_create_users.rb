class CreateUsers < ActiveRecord::Migration[5.0]
    def change
      create_table :users do |t|
        t.string :name
        t.timestamps
      end
    end
  end

  #when displaying the data to the user that will be when you are inserting like puts "#{miles} miles"