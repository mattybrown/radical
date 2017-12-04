# Create Ad Category table
class CreateAdCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :ad_categories do |t|
      t.string :name
      t.float :price
      t.boolean :company_paid
      t.boolean :mpg_ad
    end
  end
end
