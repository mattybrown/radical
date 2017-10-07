# Create Roles table
class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :access_level
      t.belongs_to :user, index: true
    end
  end
end
