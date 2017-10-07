# Create Ad Category table
class CreateAdCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :ad_categories do |t|
      t.string :name
      t.float :price
    end
  end
end
