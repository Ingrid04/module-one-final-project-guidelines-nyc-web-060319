class CreateProducts < ActiveRecord::Migration[5.2]
  def change 
    create_table :products do |table|
      table.text :name
      table.text :ingredients
    end
  end
end
