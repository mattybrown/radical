# Create ads table
class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :name
      t.text :description
      t.datetime :deadline
      t.datetime :run_date
      t.datetime :end_date
      t.boolean :vendor_pays
      t.boolean :complete
      t.boolean :approved
      t.boolean :created
      t.belongs_to :ad_group, index: true
      t.belongs_to :ad_category, index: true
      t.timestamps
    end
  end
end
