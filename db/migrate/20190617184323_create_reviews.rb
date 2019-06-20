class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |table|
      table.integer :rating
      table.text :user_id
      table.text :product_id
      table.text :content
    end
  end
end
