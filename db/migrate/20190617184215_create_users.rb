class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |table|
      table.text :name
      table.text :preferences
    end
  end
end
