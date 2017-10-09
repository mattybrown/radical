# Create Ad Groups table
class CreateAdGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :ad_groups do |t|
      t.string :name
      t.string :canonical
      t.integer :listing_number
      t.float :budget
      t.boolean :paid
      t.belongs_to :user, index: true
      t.belongs_to :ads, index: true
      t.timestamps
    end
  end
end
